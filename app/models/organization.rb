class Organization < ActiveRecord::Base

#Constants
INDUSTRY_LIST = ['Construction', 'Capital Goods', 'Consumer Durables', 'Consumer Services', 'Energy', 'Finance', 'Health', 'Utilities', 'Technology', 'Transportation', 'Other'].freeze

# Relationships	
has_one :address
belongs_to :user

# Scopes
  scope :alphabetical,  -> { order(:name) }
  scope :active,        -> { where(active: true) }
  scope :inactive,      -> { where(active: false) }


# Validations
  validates :name, presence: true, uniqueness: { case_sensitive: false}
  validates_inclusion_of :industry, in: INDUSTRY_LIST
  validate :active_user_check


# Other Fields
#The below is only to be used in the form interaction.
#An admin/manager can add an username instead of select box
attr_accessor owner_username

# Callbacks

# Other methods
private
	def active_user_check
		#Custom validation for active item and non nil item

		checkid = self.owner.id
		unless (User.where(id: checkid).present?) 
			errors.add(:active, 'User is not present')
			return false
		end
		checkUser = User.find(checkid)
		unless checkUser.active == true
			errors.add(:active,'Needs to be an active user')
			return false
		end
		return true
	end
end




end
