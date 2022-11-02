class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  before_action :set_path, only: [:edit,:destroy]


  def index
    @items = Item.order("created_at DESC")
    
    
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  def show
   
  end
  def edit
    if @item.purchase
      redirect_to root_path
    end
  end
  def update
    
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end
  def destroy
     @item.destroy
     redirect_to root_path
  end
  private

  def find_item
     @item = Item.find(params[:id])
  end

  def set_path
    if current_user.id != @item.user.id 
      redirect_to root_path
    end
  end

  def item_params
    params.require(:item).permit(:item_name, :item_explain, :item_category_id, :item_price, :item_situation_id, :delivery_charge_id, :prefecture_id ,:date_of_shipment_id,:image,
    ).merge(user_id: current_user.id)
  end
end
