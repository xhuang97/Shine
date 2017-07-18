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
  end
end
