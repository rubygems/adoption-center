class SiteController < ApplicationController
  def index
  end

  def search_gems
    @query = params[:search]
    @gems_adoptions = GemsAdoption.search(@query)
  end
end
