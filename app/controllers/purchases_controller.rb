class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
 
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    @purchase_delivery = PurchaseDelivery.new
  end


  def create
    @item = Item.find(params[:item_id])
    @purchase_delivery = PurchaseDelivery.new(purchase_params)
    if @purchase_delivery.valid?
      pay_item
      @purchase_delivery.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private
  def purchase_params
    params.require(:purchase_delivery).permit(:post_code, :prefecture_id, :city, :street_number, :phone_number, :building_name, ).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数はシェルに設定 vim ~/.zshrc
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
