class GemsAdoptionsController < ApplicationController
  before_action :require_login, only: [:new, :create, :destroy]

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

  def destroy
    current_user.gems_adoptions.find(params[:id]).destroy
    flash[:success] = 'Gem removed'
    redirect_to :gems
  end

  private

  def gems_adoption_params
    params.require(:gems_adoption).permit(:ruby_gem_id, :description)
  end
end
