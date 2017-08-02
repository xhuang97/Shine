class Registry < ActiveRecord::Base
  include ShineHelpers::Validations

# Relationships
  belongs_to :organization
  has_many :registry_items
  accepts_nested_attributes_for :registry_items, allow_destroy: true
  

# Scopes
  scope :alphabetical,  -> { order(:title) }
  scope :active,        -> { where(is_active: true) }
  scope :inactive,      -> { where(is_active: false) }


# Validations
  validates_presence_of :title
  validates_presence_of :organization
  validate :verified_organization
# Callbacks

# Other methods
def make_inactive
  self.update_attribute(:is_active, false)
end


private

def verified_organization
  unless self.organization.nil? || self.organization.verified  
     errors.add(:organization, "Organization needs to be verified in order to make a registry")
  end
end




end
