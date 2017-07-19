class FufillmentItem < ActiveRecord::Base

  # Relationships
  belongs_to :user
  belongs_to :registry_item_field

  # Scopes
  # Validations
  # Callbacks

  # Other methods

end
