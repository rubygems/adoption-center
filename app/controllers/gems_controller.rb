class GemsController < ApplicationController
  def index
    @gems = Gems.gems(current_user.username)
    @gems.sort_by! { |g| g['name'] }
  end
end
