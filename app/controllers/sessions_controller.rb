class SessionsController < ApplicationController
   def new
      if(!current_user.nil?)
        redirect_to home_path, notice: "Already Logged in!"
        return
      end
    end

    def create

      user = User.find_by_email(params[:email])
      if user && User.authenticate(params[:email], params[:password])
       begin
         a = User.find(session[:user_id])
         redirect_to user_path, notice: "User Created!"
       rescue Exception
          session[:user_id] = user.id
         
          redirect_to home_path, notice: "Logged in!"
        end
      else
        redirect_to login_path, notice: "Email or password is invalid"
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to home_path, notice: "Logged out!"
    end
end
