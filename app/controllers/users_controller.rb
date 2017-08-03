class UsersController < ApplicationController
  def index
    @users = User.alphabetical.active.paginate(:page => params[:page]).per_page(10)
    
  end

  def new
    @user = User.new
  end

  def edit
     @user = User.find(params[:id])
    
  end


  def show
    @user = User.find(params[:id])
  end



  def create
    @user = User.new(user_params)
    unless(admin? || manager?)
      @user.role = 'customer'
    end


    if @user.save
        unless(admin? || manager?)
           session[:user_id] = @user.id
           redirect_to home_path, notice: "Thank you for signing up!"
        else
          redirect_to users_path, notice: "User Created"
        end
    
    else
      flash[:error] = "This user could not be created."
      render "new"
    end
  end

  def update
     @user = User.find(params[:id])
   
    if @user.update_attributes(user_params)
      redirect_to(user_path(@user), :notice => 'User was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def user_params
    params.require(:user).permit(:password, :username, :phone, :password_confirmation, :avatar, :first_name, :last_name, :email, :role, :active)
  end

end
