require 'test_helper'

class RegistryTest < ActiveSupport::TestCase

	should belong_to(:organization)
	should have_many(:registry_items)

	should validate_presence_of(:title)

	should "Have alphabetical Scope" do
		assert false
	end

	should "Have active Scope" do
		assert false
	end

	should "Have inactive Scope" do
		assert false
	end


	should "Require organiztion to be verified" do
		assert false
	end


end
