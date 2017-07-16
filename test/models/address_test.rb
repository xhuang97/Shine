require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  should belong_to(:organization)
  should validate_presence_of(:street_1)
  should validate_presence_of(:zipcode)
  should validate_presence_of(:city)


  should allow_value(27519).for(:zipcode)
  should_not allow_value(323422).for(:zipcode)

  should allow_value("AL").for(:state)
  should_not allow_value("ZC").for(:state)



context "Within context" do
  setup do  
    create_users
  end
    
  teardown do
      destroy_users
  end


  should "reject duplicate addresses" do
	  	@Shine = FactoryGirl.create(:organization, user: @alex)
      @NotShine = FactoryGirl.create(:organization, name: "NotShine", user: @alina)

      @CMU = FactoryGirl.create(:address, organization: @Shine)
      @NotValid = FactoryGirl.build(:address, organization: @NotShine)
      deny @NotValid.valid?

      @NotValid.street_2 = "PO Box 1"
      assert @NotValid.valid?

      @Shine.delete
      @NotShine.delete
      @CMU.delete
  end

end
end
