class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.alphabetical.active.paginate(:page => params[:page]).per_page(10)
  
  end

  def new
    @organization = Organization.new
    @address = Address.new
  end

  def edit
     @organization = Organization.find(params[:id])
    
  end


  def show
    @organization = Organization.find(params[:id])
    
  end

  def create
    @organization = Organization.new(organization_params)
    @organization.user_id = current_user.id
    @address = Address.new(address_params)
    @organization.address = @address

     unless @address.save
      flash[:error] = "This Address is invalid."
      render "new"
      return
     end

    
    if @organization.save
           redirect_to organization_path, notice: "Thank you for adding your organization" 
    else
      @address.delete
      flash[:error] = "This organization could not be created."
      render "new"
    end
  end

  def update
     @organization = Organization.find(params[:id])
   
    if @organization.update_attributes(organization_params)
      redirect_to(organization_path(@organization), :notice => 'Organization was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def organization_params
    params.require(:organization).permit(:name, :for_profit, :industry)
  end

  def address_params
    params.require(:organization).require(:address).permit(:street_1, :street_2, :city, :state, :zipcode)
  end

end
