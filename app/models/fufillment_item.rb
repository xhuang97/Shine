class FulfillmentItem < ActiveRecord::Base

  # Relationships
  belongs_to :user
  belongs_to :registry_item_field

  # Scopes
  scope :getboolean, -> { where.not(:user_boolean => nil)}
  scope :gettext, -> { where.not(:user_text => nil)}

  # Validations

  # Callbacks

  # Other methods

end
