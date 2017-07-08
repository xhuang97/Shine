class Organization < ActiveRecord::Base

# Relationships
has_one :address
belongs_to :user

# Scopes
  scope :alphabetical,  -> { order(:name) }
  scope :active,        -> { where(active: true) }
  scope :inactive,      -> { where(active: false) }


# Validations
  validates :name, presence: true

# Callbacks

# Other methods
end




end
