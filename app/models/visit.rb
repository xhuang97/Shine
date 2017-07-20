class Visit < ActiveRecord::Base
  include ShineHelpers::Validations

  # Relationships
  has_many :ahoy_events, class_name: "Ahoy::Event"
  belongs_to :user
end
