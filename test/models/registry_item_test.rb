require 'test_helper'

class RegistryItemTest < ActiveSupport::TestCase
	
	should belong_to(:registry)
	should have_many(:registry_item_fields)

	should validate_presence_of(:x)
	should validate_presence_of(:y)
	should validate_presence_of(:content_type)
	should validate_inclusion_of(:content_type).in_array(RegistryItem::CONTENT_TYPE_LIST)


	 should "Have Grid Scope" do
	 	assert false
	 end

end
