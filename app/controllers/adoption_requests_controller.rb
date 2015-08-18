class AdoptionRequestsController < ApplicationController
  before_action :require_login

  def new
    @gem_adoption = GemsAdoption.find(params[:id])
    @adoption_request = @gem_adoption.adoption_requests.build
  end

  def create
    @adoption_request = current_user.adoption_requests.build(adoption_request_params)
    if @adoption_request.save
      flash[:success] = 'Adoption request sent'
      redirect_to gem_path(@adoption_request.gems_adoption.ruby_gem)
    else
      render :new
    end
  end

  private

  def adoption_request_params
    params.require(:adoption_request).permit(:gems_adoption_id, :description)
  end
end
