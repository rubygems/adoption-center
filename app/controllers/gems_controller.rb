class GemsController < ApplicationController
  def index
    @gems = Gems.gems(current_user.username)
    @gems.sort_by! { |g| g['name'] }
  end

  def show
    @gem = Gems.info(params[:id])
    @gem_owners = Gems.owners(params[:id])
    @gem_adoption = GemsAdoption.find_by_gem(params[:id])
    if @gem_adoption
      @adoption_request = AdoptionsRequest.find_by(user_id: current_user.id, gems_adoption_id: @gem_adoption.id)
    end
  end
end
