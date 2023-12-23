class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :sold_out_item, only: [:index, :create]
  before_action :purchase_to_index, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
 
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @purchase_delivery = PurchaseDelivery.new
  end


  def create
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
  def set_item
    @item = Item.find(params[item_id])
  end
  def purchase_params
    params.require(:purchase_delivery).permit(:post_code, :prefecture_id, :city, :street_number, :phone_number, :building_name, ).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def sold_out_item
    redirect_to root_path if @item.purchase.present?
  end

  def purchase_to_index
    redirect_to root_path if current_user == @item.user
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
