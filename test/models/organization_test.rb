require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
	should have_one(:address)
	should have_many(:registries)
	should belong_to(:user)


  should validate_presence_of(:name)
  should validate_uniqueness_of(:name)
  should validate_inclusion_of(:industry).in_array(['Construction', 'Capital Goods', 'Consumer Durables', 'Consumer Services', 'Energy', 'Finance', 'Health', 'Utilities', 'Technology', 'Transportation', 'Communication', 'Other'])


context "Within context" do
  setup do  
    create_users
    create_organizations
  end
    
  teardown do
  	  destroy_organizations
      destroy_users
  end

  should "Have alphabetical scope" do
  		assert_equal ["Google", "Red Cross", "Shine Symphony", "Startup"], Organization.alphabetical.map(&:name)
  end 
  	
  should "Have for_profit scope" do
  	assert_equal ["Google"], Organization.for_profit.map(&:name)
  end

  should "Have not_for_profit scope" do
  	assert_equal ["Shine Symphony", "Red Cross", "Startup"], Organization.not_for_profit.map(&:name)
  end

  should "Have active scope" do
  	assert_equal ["Shine Symphony", "Google", "Red Cross"], Organization.active.map(&:name)
  end

  should "Have inactive scope" do
  	assert_equal ["Startup"], Organization.inactive.map(&:name)
  end

  should "Only allow active users" do
  		@badOrg = FactoryGirl.build(:organization, name:"Inactive", user: @inactive)
  		deny @badOrg.valid?
  end

end

end
