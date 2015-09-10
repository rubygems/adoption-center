class GemsController < ApplicationController
  def index
    @ruby_gems = current_user.ruby_gems.order(:name)
  end

  def show
    @ruby_gem = RubyGem.find(params[:id])
    @gem_adoption = GemsAdoption.find_by(id: params[:id])
    if @gem_adoption
      @adoption_request =  current_user.adoption_requests.find_by(gems_adoption_id: @gem_adoption.id)
    end
  end
end
