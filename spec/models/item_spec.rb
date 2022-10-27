require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe "商品出品機能" do
    context '出品ができる場合' do
      it 'item_name item_price item_explain item_category_id item_situation_id prefecture_id delivery_charge_id date_of_shipment_id item' do
       expect(@item).to be_valid
      end
    end
    context '出品ができない場合' do
      it "item_nameが空だと登録できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "item_priceが空だと登録できない" do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number")
      end
      it "item_explainが空だと登録できない" do
        @item.item_explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item explain can't be blank")
      end
      it "item_category_idが空だと登録できない" do
        @item.item_category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it "item_situation_idが空だと登録できない" do
        @item.item_situation_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item situation can't be blank")
      end
      it "delivery_charge_idが空だと登録できない" do
        @item.delivery_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it "prefecture_idが空だと登録できない" do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "date_of_shipment_idが空だと登録できない" do
        @item.date_of_shipment_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Date of shipment can't be blank")
      end
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '販売価格が￥300より少ない時は出品できないこと' do
        @item.item_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be greater than or equal to 300')
      end
      it '販売価格が￥9999999より多い時は出品できないこと' do
        @item.item_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be less than or equal to 9999999')
      end
      it 'priceが全角では登録できない' do
        @item.item_price = '９９９９'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number")
        user
      end
    end
  end
end
