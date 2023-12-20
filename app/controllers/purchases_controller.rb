class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index
 
  def index
    @item = Item.find(params[:item_id])
    @purchase_delivery = PurchaseDelivery.new
  end


  def create
    @item = Item.find(params[:item_id])
    @purchase_delivery = PurchaseDelivery.new(purchase_params)
    if @purchase_delivery.valid?
      @purchase_delivery.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def purchase_params
    params.require(:purchase_delivery).permit(:post_code, :prefecture_id, :city, :street_number, :phone_number, :building_name, ).merge(item_id: params[:item_id], user_id: current_user.id)
  end
end
