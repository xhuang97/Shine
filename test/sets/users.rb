module Contexts
  module Users

  	def create_users
      	@alex = FactoryGirl.create(:user)
       	@walt = FactoryGirl.create(:user, first_name: "walt", last_name:"walrus", username: "wbd", email: "wbd@gmail.com", role: "customer")
       	@sam = FactoryGirl.create(:user, first_name: "sam", last_name:"walrus", username: "sam", email: "sammy@gmail.com", role: "customer")
       	@kim = FactoryGirl.create(:user, first_name: "kim", last_name:"shim", username: "kim", email: "kim@gmail.com", role: "customer")
       	@alina = FactoryGirl.create(:user, first_name: "alina", last_name:"bina", username: "alina", email: "alina@gmail.com", role: "manager")
       	@inactive = FactoryGirl.create(:user, first_name: "maximum", last_name:"true", username: "maximum", email: "alex@gmail.com", role: "manager", is_active: false)
  	end


  	def destroy_users
  	  @alex.delete
      @walt.delete
      @sam.delete
      @alina.delete
      @inactive.delete
  	end

  end
end