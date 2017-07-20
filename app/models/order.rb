class Order < ActiveRecord::Base

  include ShineHelpers::Validations

  # Relationships
  belongs_to :user
  has_many :order_items

  # Virtual attributes (non-saved)
  attr_reader :destroyable

  # Scopes
  scope :chronological, -> { order(date_ordered: :desc) }
  scope :bycost, -> {order(grand_total: :desc)}

  # Validations
  validates_presence_of :grand_total
  # validates_date :date_ordered  # not essential, but permittable
  validates_numericality_of :grand_total, greater_than_or_equal_to: 0, allow_blank: false
  validate :user_is_active_in_system

  # Other methods


  # Callbacks
  before_create :set_date_if_not_given
  before_destroy :is_destroyable?
  # after_destroy :remove_unshipped_order_items
  # after_rollback :remove_remaining_unshipped_order_items

  private
  def user_is_active_in_system
    is_active_in_system(:user)
  end

  def set_date_if_not_given
    unless self.date_ordered && self.date_ordered.is_a?(Date)
      self.date_ordered = Date.current
    end
  end

  def is_destroyable?
    # @destroyable = self.order_items.shipped.empty?
    # remove_unshipped_order_items
    # return @destroyable

    # somehow decide this
    return false
  end

end
