class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item, only: [:index, :create]
  def index
    
    @purchase_shipping = PurchaseShipping.new
    if  current_user.id == @item.user.id
      redirect_to root_path
    end
    if @item.purchase
      redirect_to root_path
    end
    
    

  end

  def new
    
  end

  def create
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase_shipping.valid?
      pay_item
      @purchase_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  

  private

  def purchase_params
    params.require(:purchase_shipping).permit(:post_code, :prefecture_id, :municipality, :address, :building, :phone_number).merge(user_id: current_user.id, token: params[:token],item_id: @item.id)
  end

  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount:@item.item_price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
  end

  def find_item
    @item = Item.find(params[:id])
 end

end
