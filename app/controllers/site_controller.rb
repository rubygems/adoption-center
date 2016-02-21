class SiteController < ApplicationController
  
  def index
    @gems_adoption_count = GemsAdoption.count
  end

  def search_gems
    page = params[:page] || 1
    @title = 'search'
    @subtitle = "for #{params[:query]}"
    @gems_adoptions = GemsAdoption.search(params[:query]).page(page)
  end
end
