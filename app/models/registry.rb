class Registry < ActiveRecord::Base

# Relationships
  belongs_to :organization
  has_many :registry_items
  has_one :user, :through => :user_registries

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
