class RegistryItemField < ActiveRecord::Base

  include ShineHelpers::Validations

  # Relationships
  belongs_to :registry_item
  has_many :fulfillment_items

  # Scopes

  # Validations
  validates_presence_of :prompt

  # Callbacks

  # Other methods

end
