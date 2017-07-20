require 'test_helper'

class OrderTest < ActiveSupport::TestCase

  # test relationships
  should have_many(:order_items)
  # should have_many(:items).through(:order_items)
  should belong_to(:user)
  # should belong_to(:school)

  # test simple validations with matchers
  should validate_presence_of(:grand_total)
  should validate_numericality_of(:grand_total).is_greater_than_or_equal_to(0)
  # ... if there is a validation on date field
  # should allow_value(Date.current).for(:date)
  # should allow_value(1.day.ago.to_date).for(:date)
  # should allow_value(1.day.from_now.to_date).for(:date)
  # should_not allow_value("bad").for(:date)
  # should_not allow_value(2).for(:date)
  # should_not allow_value(3.14159).for(:date)

   context "Within context" do
    setup do
      # create_items
      # create_item_prices
      create_users
      # create_schools
      create_orders
      create_order_items
    end

    teardown do
      # destroy_items
      # destroy_item_prices
      destroy_users
      # destroy_schools
      destroy_orders
      destroy_order_items
    end

    should "verify that the date is set for today unless otherwise specified" do
      assert_equal @alex_o1.date_ordered, 5.months.ago.to_date  # a specified date is unchanged
      sam_o3 = FactoryGirl.create(:order, user: @sam, grand_total: 100.00, date_ordered: nil)
      assert_equal sam_o3.date_ordered, Date.current  # an order without any date is set to today by default
      sam_o3.delete
      sam_o2 = FactoryGirl.create(:order, user: @sam, grand_total: 100.00, date_ordered: "groundhog day")
      assert_equal sam_o2.date_ordered, Date.current  # an order without a legitimate date is set to today by default
      sam_o2.delete
    end

    should "verify that the user is active in the system" do
      # inactive user
      @bad_order = FactoryGirl.build(:order, user: @melanie, school: @cent_cath, grand_total: 5.25, payment_receipt: "dcmjgwwtsd39x6wfc1", date: 5.days.ago.to_date)
      deny @bad_order.valid?
      # non-existent user
      ghost = FactoryGirl.build(:user, first_name: "Ghost")
      non_user_order = FactoryGirl.build(:order, user: ghost, school: @cent_cath)
      deny non_user_order.valid?
    end

    should "have a working scope called chronological" do
      assert_equal [54.5, 32.5, 388.5, 79.75, 43.9, 94.95], Order.chronological.all.map(&:grand_total)
    end

    should "have a working scope called bycost" do
      assert_equal [388.5, 94.95, 79.75, 54.5, 43.9, 32.5], Order.bycost.all.map(&:grand_total)
    end


  end
end
