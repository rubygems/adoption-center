class GemsAdoptionsController < ApplicationController
  before_action :require_login

  def new
    @gems_adoption = GemsAdoption.new(gem: params[:id])
  end

  def create
    @gems_adoption = current_user.gems_adoptions.build(gems_adoption_params)
    if @gems_adoption.save
      flash[:success] = 'Gem up for adoption'
      redirect_to gem_path(id: @gems_adoption.gem)
    else
      render :new
    end
  end

  def destroy
    current_user.gems_adoptions.find(params[:id]).destroy
    flash[:success] = 'Gem removed'
    redirect_to gems_path
  end

  private

  def gems_adoption_params
    params.require(:gems_adoption).permit(:gem, :description)
  end
end
