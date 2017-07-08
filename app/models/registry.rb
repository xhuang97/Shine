class Registry < ActiveRecord::Base

# Relationships
  belongs_to :organization
  has_many :registry_items
  has_one :user, :through => :user_registries

# Scopes
  scope :alphabetical,  -> { order(:title) }
  scope :active,        -> { where(active: true) }
  scope :inactive,      -> { where(active: false) }


# Validations
  validates :title, presence: true

# Callbacks

# Other methods
end
