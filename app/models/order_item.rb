class OrderItem < ActiveRecord::Base

  include ShineHelpers::Validations

  # Relationships
  belongs_to :order

  # Scopes
  scope :byitem, -> { order(:item_name).order(:quantity) }
  scope :byquantity, -> { order(:quantity) }

  # Validations
  validates_presence_of :item_name, :quantity
  validates_numericality_of :quantity, only_integer: true, greater_than: 0

  # Other methods


end
