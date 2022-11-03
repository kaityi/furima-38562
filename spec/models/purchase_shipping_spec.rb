require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  describe '商品購入機能' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @purchase_shipping = FactoryBot.build(:purchase_shipping, user_id: @user.id, item_id: @item.id)
      sleep(1)
    end
    context '全ての項目が入力されていれば購入できる' do
      it 'post_code, prefecture_id, municipality, address, phone_number,user_id,token、' do
        expect(@purchase_shipping).to be_valid
      end
      it '建物名は空でも登録できる' do
        @purchase_shipping.building = ''
        expect(@purchase_shipping).to be_valid
      end
    end
    context '購入が出来ない場合' do
      it '郵便番号が空では登録できない' do
        @purchase_shipping.post_code = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Post code can't be blank")
      end
      it '都道府県を選択しないと登録できない' do
        @purchase_shipping.prefecture_id = '1'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村がからでは登録できない' do
        @purchase_shipping.municipality = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空では登録できない' do
        @purchase_shipping.address = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では登録できない' do
        @purchase_shipping.phone_number = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'tokenが空では登録できない' do
        @purchase_shipping.token = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号は3桁ハイフン4桁以外は登録できない' do
        @purchase_shipping.post_code = '1234-234'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '郵便番号は全角文字では登録できない' do
        @purchase_shipping.post_code = '１２３−１２３４'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '電話番号は12桁以上では登録できない' do
        @purchase_shipping.phone_number = '090111111111'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it '電話番号は9桁以内では登録できない' do
        @purchase_shipping.phone_number = '090111111'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Phone number is too short (minimum is 10 characters)')
      end
      it '電話番号は全角文字では登録できない' do
        @purchase_shipping.phone_number = '０９０１１１１１１１１'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Phone number 半角で入力してください')
      end
      it 'userと紐づいていないと登録できない' do
        @purchase_shipping.user_id = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'itemと紐づいていないと登録できない' do
        @purchase_shipping.item_id = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
