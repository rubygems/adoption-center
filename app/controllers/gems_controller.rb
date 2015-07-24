class GemsController < ApplicationController
  def index
    @gems = Gems.gems(current_user.username)
    @gems.sort_by! { |g| g['name'] }
  end

  def show
    @gem = Gems.info(params[:id])
    @gem_owners = Gems.owners(params[:id])
  end
end
