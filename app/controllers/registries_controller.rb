class RegistriesController < ApplicationController
  def index
    @registries = Registry.alphabetical.active.paginate(:page => params[:page]).per_page(10)
  
  end

  def new
    #Check for approval of Organization
    @registry = Registry.new
    @registry.registry_items.build
    @registry.registry_item_fields.build
  end

  def edit
     @registry = Registry.find(params[:id])
     
  end


  def show
    #Grab Registry Items
    @registry = Registry.find(params[:id])
    @registryItems = @registry.registry_items.grid


  end

  def create
    @registry = Registry.new(registry_params)
    @registry.organization_id = current_user.organization.id

    if @registry.save
        redirect_to new_registry_path, notice: "Thank you for adding your registry!"
    else
      flash[:error] = "This registry could not be created."
      render "new"
    end
  end

  def update
    @registry = Registry.find(params[:id])
    if @registry.update_attributes(registry_params)
      redirect_to(registry_path(@registry), :notice => 'Registry was successfully updated.')
    else
      render :action => "edit"
    end
  end


  def registry_params
    params.require(:registry).permit(:title, :description)
  end

end
