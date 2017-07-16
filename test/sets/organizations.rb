module Contexts
  module Organizations

  	def create_organizations
        @Shine = FactoryGirl.create(:organization, user: @alex)
      	@Google = FactoryGirl.create(:organization, user: @alina, name:"Google", industry:'Construction', for_profit: true, is_active: true)
       	@RedCross = FactoryGirl.create(:organization, user: @walt, name:"Red Cross", industry:'Health', for_profit: false, is_active: true)
        @inactiveOrganization = FactoryGirl.create(:organization, user: @sam, name:"Startup",  is_active: false)
  	end


  	def destroy_organizations
  	  # @Shine.destroy
      # @Google.destroy
      # @RedCross.destroy
      # @inactive.destroy
  	end

  end
end