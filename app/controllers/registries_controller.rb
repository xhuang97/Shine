class RegistriesController < ApplicationController
  def index
    @registries = Registry.alphabetical.active.paginate(:page => params[:page]).per_page(10)
    authorize! :index, @registry
  end

  def new
    @registry = Registry.new
  end

  def edit
     @registry = Registry.find(params[:id])
     authorize! :edit, @registry
  end


  def show
    # get the price history for this item --what does this mean???
    @registry = Registry.find(params[:id])
    authorize! :show, @registry
  end

  def create
    @registry = Registry.new(registry_params)
    if @registry.save
      
        @test = session[:registry_id]
        if(@test.nil?)
           session[:registry_id] = @registry.id
           redirect_to new_registry_path, notice: "Thank you for signing up! Make sure to add your registry!"
        else
          redirect_to registries_path, notice: "Registry Created"
        end
    
    else
      flash[:error] = "This registry could not be created."
      render "new"
    end
  end

  def update
     @registry = Registry.find(params[:id])
    #authorize! :update, @registry
    if @registry.update_attributes(registry_params)
      redirect_to(registry_path(@registry), :notice => 'Registry was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def registry_params
    params.require(:registry).permit(:title, :description, :is_active, :organizationID)
  end

end
