class SiteController < ApplicationController
  def index
  end

  def search_gems
  	@gems = GemsAdoption.search(params[:search])
  end
end
