class Organization < ActiveRecord::Base

  include ShineHelpers::Validations

#Constants
INDUSTRY_LIST = ['Construction', 'Capital Goods', 'Consumer Durables', 'Consumer Services', 'Energy', 'Finance', 'Health', 'Utilities', 'Technology', 'Transportation', 'Communication', 'Other'].freeze

# Relationships
has_one :address
has_many :registries
belongs_to :user

# Scopes
  scope :alphabetical,  -> { order(:name) }
  scope :for_profit,        -> { where(for_profit: true) }
  scope :not_for_profit,      -> { where(for_profit: false) }

  scope :active,        -> { where(is_active: true) }
  scope :inactive,      -> { where(is_active: false) }


# Validations
  validates :name, presence: true, uniqueness: { case_sensitive: false}
  validates_inclusion_of :industry, in: INDUSTRY_LIST
  validate :active_user_check
  validates :for_profit, exclusion: { in: [nil] }

# Other Fields
#The below is only to be used in the form interaction.
#An admin/manager can add an username instead of select box
attr_accessor :owner_username

# Callbacks

# Other methods
 def make_inactive
    self.update_attribute(:is_active, false)
 end

private
	def active_user_check
		#Custom validation for active item and non nil item
		checkid = self.user_id
		unless (User.where(id: checkid).present?)
			errors.add(:is_active, 'User is not present')
			return false
		end
		checkUser = User.find(checkid)
		unless checkUser.is_active == true
			errors.add(:is_active,'Needs to be an active user')
			return false
		end
		return true
	end
end
