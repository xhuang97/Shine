module Contexts
  module Addresses

  	def create_addresses
      	 @CMU = FactoryGirl.create(:address, organization: @Shine)
  	end


  	def destroy_addresses
  	     @CMU.destroy
  	end

  end
end