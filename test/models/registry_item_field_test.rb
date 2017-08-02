require 'test_helper'

class RegistryItemFieldTest < ActiveSupport::TestCase
	should have_many(:fulfillment_items)
	should belong_to(:registry_item)
	should validate_presence_of(:prompt)
end
