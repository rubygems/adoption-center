class AdoptionRequestsController < ApplicationController
  before_action :require_login

  def new
    @adoption_request = AdoptionRequest.new(gems_adoption_id: params[:id])
  end

  def create
    @adoption_request = current_user.adoption_requests.build(adoption_request_params)
    if @adoption_request.save
      flash[:success] = 'Adoption request sent'
      redirect_to gem_path(id: @adoption_request.gems_adoption.gem)
    else
      render :new
    end
  end

  private

  def adoption_request_params
    params.require(:adoption_request).permit(:gems_adoption_id, :description)
  end
end
