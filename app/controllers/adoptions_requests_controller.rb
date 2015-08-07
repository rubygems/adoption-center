class AdoptionsRequestsController < ApplicationController
  before_action :require_login

  def new
    @adoptions_request = AdoptionsRequest.new(gems_adoption_id: params[:id])
  end

  def create
    @adoptions_request = current_user.adoptions_requests.build(adoptions_request_params)
    if @adoptions_request.save
      flash[:success] = 'Adoption request sent'
      redirect_to gem_path(id: @adoptions_request.gems_adoption.gem)
    else
      render :new
    end
  end

  private

  def adoptions_request_params
    params.require(:adoptions_request).permit(:gems_adoption_id, :description)
  end
end
