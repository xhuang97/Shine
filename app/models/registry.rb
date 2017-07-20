class Registry < ActiveRecord::Base

  include ShineHelpers::Validations

# Relationships
  belongs_to :organization
  has_many :registry_items

# Scopes
  scope :alphabetical,  -> { order(:title) }
  scope :active,        -> { where(is_active: true) }
  scope :inactive,      -> { where(is_active: false) }


# Validations
  validates :title, presence: true

# Callbacks

# Other methods
 def make_inactive
    self.update_attribute(:is_active, false)
 end
end
