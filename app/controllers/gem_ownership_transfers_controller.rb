class GemOwnershipTransfersController < ApplicationController
  def index
    @ownership_transfers = GemOwnershipTransfer.includes(:old_user, :new_user, :ruby_gem).page(params[:page]).order(created_at: :desc)
  end
end
