class PurchasesController < ApplicationController
  before_action :authenticate_user!
  def index
    
    @purchase_shipping = PurchaseShipping.new
    @item = Item.find(params[:item_id])
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
    @item = Item.find(params[:item_id])
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
      Payjp.api_key ="sk_test_620a618147e1b3f777ce042d"
      Payjp::Charge.create(
        amount:@item.item_price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
  end

end
