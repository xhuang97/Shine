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
  	@visitCounts = Visit.group_by_day(:started_at).count
    @referralCounts = Visit.group(:referrer).count
    @refferingDomain = Visit.group(:referring_domain).count
    @deviceType = Visit.group(:device_type).count
    @utmSource = Visit.group(:utm_source).count
    @utmMedium = Visit.group(:utm_medium).count
    @utmTerm = Visit.group(:utm_term).count
    @utmContent = Visit.group(:utm_content).count
    @country = Visit.group(:country).count
  end
end
