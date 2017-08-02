class RegistryItem < ActiveRecord::Base

  include ShineHelpers::Validations

  CONTENT_TYPE_LIST = [['checkbox', :checkbox],['text', :text],['donation', :donation]]

  # Relationships
  belongs_to :registry
  has_many :registry_item_fields
  accepts_nested_attributes_for :registry_item_fields, allow_destroy: true
  accepts_nested_attributes_for :registry_item_fields_attributes

  # Scopes
  scope :bycontenttype,  -> { order(:content_type) }
  scope :byx, -> { order(:x) }
  scope :byy, -> { ordeR(:y) }

  # Validations
  validates_presence_of :x, :y, :content_type
  validates_inclusion_of :content_type, in: CONTENT_TYPE_LIST.map{|key, value| value}, message: "is not a valid content type"

  # potentially validates x and y (not sure what kind of values they would be)
  validates_numericality_of :x, greater_than_or_equal_to: 0, allow_blank: false
  validates_numericality_of :y, greater_than_or_equal_to: 0, allow_blank: false



  # Callbacks

  # Other methods

end
