require 'test_helper'

class UserTest < ActiveSupport::TestCase


	# test relationships
  	should have_many(:registries).through(:organization)
    should have_many(:orders)
    should have_many(:order_items).through(:orders)

  	# test validations with matchers
  	should validate_presence_of(:email)
  	should validate_presence_of(:username)
  	should validate_presence_of(:password)
    should validate_presence_of(:password_confirmation)
  	should validate_presence_of(:role)
  	should validate_uniqueness_of(:username)
  	should validate_uniqueness_of(:email)

    should validate_inclusion_of(:role).in_array(%w[admin manager customer])


  	should allow_value("abainbridge1029@gmail.com").for(:email)
  	should allow_value("abainbri@andrew.cmu.edu.com").for(:email)
  	should allow_value("customer").for(:role)
  	should allow_value("admin").for(:role)
  	should allow_value("manager").for(:role)
  	should allow_value("abcdf").for(:password)
  	should allow_value("abcd").for(:password)
  	should allow_value("abcd").for(:password)
    should allow_value("999.999-9999").for(:phone)
    should allow_value("9999999999").for(:phone)
    should allow_value("(999)999-9999").for(:phone)


  	should_not allow_value("abc").for(:password)
  	should_not allow_value("test.com").for(:email)
  	should_not allow_value("@.com").for(:email)
    should_not allow_value("afdsaf").for(:role)
    should_not allow_value("9993999-9999").for(:phone)
    should_not allow_value("99999-9999").for(:phone)




context "Within context" do
  setup do
  	create_users
  end

  teardown do
      destroy_users
  end



   should "display users in alphabetical order" do
   		assert_equal ["abainbri", "alina", "kim", "maximum", "sam", "wbd"], User.alphabetical.map(&:username)
   end

   should "display active users" do
   	assert_equal ["abainbri", "alina", "kim", "sam", "wbd"], User.active.alphabetical.map(&:username)
   end

   should "display inactive users" do
   	assert_equal ["maximum"], User.inactive.alphabetical.map(&:username)
   end

   should "display employee users" do
   	assert_equal ["abainbri", "alina", "maximum"], User.employees.alphabetical.map(&:username)
   end

   should "display customer users" do
   	assert_equal ["kim", "sam", "wbd"], User.customers.alphabetical.map(&:username)
   end

  	should "give full name of user" do
  	 assert_equal "Bainbridge, Alex", @alex.name
  	 assert_equal "walrus, walt", @walt.name
  	 assert_equal "walrus, sam", @sam.name
   end

    should "give proper name of a user" do
     assert_equal "Alex Bainbridge", @alex.proper_name
  	 assert_equal "walt walrus", @walt.proper_name
  	 assert_equal "sam walrus", @sam.proper_name
   end

   should "correctly assess role" do
   		assert @alex.role?(:admin)
   		assert @walt.role?(:customer)
   		assert @sam.role?(:customer)
   		assert @alina.role?(:manager)

   		deny @alex.role?(:customer)
   		deny @alina.role?(:admin)
   end

   should "not destroy users" do
   		@alex.destroy
   		assert User.exists?(@alex.id)
   end

   should "require users to have unique usernames and emails and is case insensitive" do
      temp = FactoryGirl.build(:user)
      deny temp.valid?
      temp.username = "uniqued"
      deny temp.valid?
      temp.email = "unique@gmail.com"
      assert temp.valid?
      temp.email = "ABAINBRI@ANDREW.CMU.EDU"
      deny temp.valid?
   end


   should "Require length 4 passwords" do
      @alex.password = "a"
      @alex.password_confirmation = "a"
      deny @alex.valid?
   end

   should "Make password and confirmation match" do
       @alex.password = "secret"
      @alex.password_confirmation = "notsecret"
      deny @alex.valid?
   end

   should "make registries inactive for inactive user" do
   	assert false
   end

   should "make organization inactive for inactive user" do
   	assert false
   end



end
end
