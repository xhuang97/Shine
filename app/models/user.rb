class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  include ShineHelpers::Validations

  # use has_secure_password
  has_secure_password

  # Relationships
  has_one :organization
  has_many :registries, through: :organization
  has_many :orders
  has_many :order_items, through: :orders

  # Scopes
  scope :alphabetical,    -> { order(:last_name).order(:first_name) }
  scope :active,          -> { where(is_active: true) }
  scope :inactive,        -> { where(is_active: false) }
  scope :employees,       -> { where.not(role: 'customer') }
  scope :customers,       -> { where(role: 'customer') }

  # Validations
  validates :username, presence: true, uniqueness: { case_sensitive: false}
  validates :email, presence: true, uniqueness: { case_sensitive: false}, format: { with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, message: "is not a valid format" }
  validates :phone, format: { with: /\A\(?\d{3}\)?[-. ]?\d{3}[-.]?\d{4}\z/, message: "should be 10 digits (area code needed) and delimited with dashes only", allow_blank: true }
  validates :role, inclusion: { in: %w[admin manager customer], message: "is not a recognized role in system" }
  validates_presence_of :password, on: :create
  validates_presence_of :password_confirmation, on: :create
  validates_confirmation_of :password, on: :create, message: "does not match"
  validates_length_of :password, minimum: 4, message: "must be at least 4 characters long", allow_blank: true
  validates_presence_of :role

  # For use in authorizing with CanCan
 ROLE_LIST = [['Administrator', :admin],['Manager', :manager],['Customer',:customer]]

  def role?(authorized_role)
    return false if role.nil?
    role.downcase.to_sym == authorized_role
  end

  # Other methods
  def name
    "#{last_name}, #{first_name}"
  end

  def proper_name
    "#{first_name} #{last_name}"
  end

   def self.authenticate(email,password)
    find_by_email(email).try(:authenticate, password)
   end




  # Callbacks
  before_destroy :is_destroyable?
  before_save :reformat_phone
  before_update :check_active

  private
  def reformat_phone
    phone = self.phone.to_s  # change to string in case input as all numbers
    phone.gsub!(/[^0-9]/,"") # strip all non-digits
    self.phone = phone       # reset self.phone to new string
  end

  def is_destroyable?
    false
  end

  def check_active
    if self.active = false
      unless self.organization.nil?
        self.organization.make_inactive
      end

      registries = self.registries

      unless registries.nil?
        registries.each do |reg|
          reg.make_inactive
        end
      end

    end
  end


end
