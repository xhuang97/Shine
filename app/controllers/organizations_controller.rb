fclass OrganizationsController < ApplicationController
  def index
    @organizations = Organization.alphabetical.active.paginate(:page => params[:page]).per_page(10)
    authorize! :index, @organization
  end

  def new
    @organization = Organization.new
  end

  def edit
     @organization = Organization.find(params[:id])
     authorize! :edit, @organization
  end


  def show
    # get the price history for this item
    @organization = Organization.find(params[:id])
    authorize! :show, @organization
  end

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
        @test = session[:organization_id]
        if(@test.nil?)
           session[:organization_id] = @organization.id
           redirect_to new_organization_path, notice: "Thank you for signing up! Make sure to add your organization!" #Is this right???
        else
          redirect_to organizations_path, notice: "Organization Created"
        end
    
    else
      flash[:error] = "This organization could not be created."
      render "new"
    end
  end

  def update
     @organization = Organization.find(params[:id])
    #authorize! :update, @organization
    if @organization.update_attributes(organization_params)
      redirect_to(organization_path(@organization), :notice => 'Organization was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def organization_params
    params.require(:organization).permit(:name, :type, :for_profit, :industry, :is_active, :OwnerID)
  end

end
