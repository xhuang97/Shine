class RegistryItem < ActiveRecord::Base

  include ShineHelpers::Validations

  # Constants
  CONTENT_TYPE_LIST = ['checkbox', 'text', 'donation']

  # Relationships
  belongs_to :registry
  has_many :registry_item_fields
  accepts_nested_attributes_for :registry_item_fields, allow_destroy: true
  

  # Scopes
  scope :grid, -> { order(:y, :x) }

  # Validations
  validates_presence_of :x, :y, :content_type
  validates_inclusion_of :content_type, in: CONTENT_TYPE_LIST, message: "is not a valid content type"
  validates_numericality_of :x, greater_than_or_equal_to: 0, allow_blank: false
  validates_numericality_of :y, greater_than_or_equal_to: 0, allow_blank: false



  # Callbacks

  # Other methods

end
