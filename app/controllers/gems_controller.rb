class GemsController < ApplicationController
  before_action :require_login, only: [:index]

  def index
    @ruby_gems = current_user.ruby_gems.order(:name)
  end

  def show
    @ruby_gem = RubyGem.find(params[:id])
    @gem_adoption = @ruby_gem.gems_adoption
    if @gem_adoption && logged_in?
      @adoption_request =  current_user.adoption_requests.find_by(gems_adoption_id: @gem_adoption.id)
    end
  end
end
