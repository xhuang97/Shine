class HomeController < ApplicationController
  def home
   
  end

  def about
  end

  def contact
  end

  def privacy
  end

  def analytics
  	#Analytics Page
    @visitCounts = Visit.group_by_day(:started_at).count
    @visitCountsByDayOfWeek = Visit.group_by_day_of_week(:started_at, format:"%a").count 
    #"format" is based off chartkick example, I don't know what it does
    @referralCounts = Visit.group(:referrer).count
    @refferingDomains = Visit.group(:referring_domain).count
    @landingPages = Visit.group(:landing_page).count
    @deviceTypes = Visit.group(:device_type).count
    @utmSources = Visit.group(:utm_source).count
    @utmMediums = Visit.group(:utm_medium).count
    @utmTerms = Visit.group(:utm_term).count
    @utmContent = Visit.group(:utm_content).count
    @countries = Visit.group(:country).count

    #Admin/Manager Home Page
    @activeRegistries = Registry.group(:is_active).count 
    #I'm not sure if there is a different way to just get the number of active registries, not active and inactive
    @createdRegistries = Registry.group_by_day(:created_at).count
    #@updatedRegistries = Registry.group_by_day(:upated_at).count

    @activeUsers = User.group(:is_active).count #same note as above
    @createdUsers = User.group_by_day(:created_at).count
    @userRoles = User.group_by_day(:role).count

    @orderCounts = Order.group_by_day(:date_ordered).count
    @ordersGrandTotal = Order.group_by_day(:date_ordered).sum(:grand_total)

    @activeOrganizations = Organization.group(:is_active).count #same note as above
    @createdOrganizations = Organization.group_by_day(:created_at).count
    @forProfitOrganizations = Organization.group(:for_profit).count
    @organizationIndustries = Organization.group(:industry).count

    #@createdRegistryItems = Registry_Item.group_by_day(:created_at).count
    #@updatedRegistryItems = Registry_Item.group_by_day(:updated_at).count
    #@registryItemsContent = Registry_Item.group(:content_type).count

    #I want to count the number of news letter subscribers total; I don't know how to do that.
    #@createdNewsLetterSubscribers = News_Letter.group_by_day(:created_at).count
  end
end
