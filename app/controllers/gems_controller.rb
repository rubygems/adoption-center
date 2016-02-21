class GemsController < ApplicationController
  before_action :require_login, only: [:index]

  def index
    @ruby_gems = current_user.ruby_gems.order(:name)
  end

  def show
    @ruby_gem = RubyGem.find(params[:id])
    @gems_adoption = @ruby_gem.gems_adoption
    @adoption_owner = @gems_adoption.user
    @title = @ruby_gem.name
    if @gems_adoption && logged_in?
      @adoption_request =  current_user.adoption_requests.find_by_gems_adoption_id(@gems_adoption.id)
    end
  end
end
