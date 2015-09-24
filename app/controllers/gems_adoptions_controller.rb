class GemsAdoptionsController < ApplicationController
  before_action :require_login, except: :index

  def index
    @gems_adoptions = GemsAdoption.page(params[:page])
  end

  def new
    @ruby_gem = current_user.ruby_gems.find(params[:id])
    @gems_adoption = @ruby_gem.build_gems_adoption
  end

  def create
    @gems_adoption = current_user.gems_adoptions.build(gems_adoption_params)
    if @gems_adoption.save
      flash[:success] = 'Gem up for adoption'
      redirect_to gem_path(@gems_adoption.ruby_gem)
    else
      render :new
    end
  end

  def update
    adoption_request = AdoptionRequest.find(params[:id])
    gems_adoption = adoption_request.gems_adoption
    if gems_adoption.update(status: 'closed') && GemOwnershipTransfer.create(old_user: current_user, new_user_id: adoption_request.user_id, ruby_gem_id: gems_adoption.ruby_gem_id)
      deliver_adoption_request_accepted_email(adoption_request)
      deliver_adoption_request_rejected_email(adoption_request)
      flash[:success] = "Gem ownership transferred"
      redirect_to gem_path(gems_adoption.ruby_gem)
    else
      flash[:danger] = "Gem couldn't be transferred"
      redirect_to :adoption_requests
    end
  end

  def destroy
    current_user.gems_adoptions.find(params[:id]).destroy
    flash[:success] = 'Gem removed from adoption'
    redirect_to :gems
  end

  private

  def gems_adoption_params
    params.require(:gems_adoption).permit(:ruby_gem_id, :description)
  end

  def deliver_adoption_request_accepted_email(adoption_request)
    NotificationMailer.email_adoption_request_status(adoption_request.user, adoption_request.gems_adoption.ruby_gem, "Accepted").deliver_now
  end

  def deliver_adoption_request_rejected_email(adoption_request)
    rejected_users = AdoptionRequest.where(gems_adoption_id: adoption_request.gems_adoption).where.not(user_id: adoption_request.user)
    rejected_users.each do |rejected_user|
      NotificationMailer.email_adoption_request_status(rejected_user.user, adoption_request.gems_adoption.ruby_gem, "Rejected").deliver_now
    end
  end
end
