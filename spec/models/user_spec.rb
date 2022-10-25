require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    context '新規登録ができる場合' do
      it 'nickname email password password_confirmation first_name last_name first_name2 last_name_2' do
       expect(@user).to be_valid
      end
    end

    context '新規登録ができない場合' do
        it "nicknameが空だと登録できない" do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it "emailが空では登録できない" do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it 'encrypted_passwordが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'passwordとpassword_confirmationが不一致では登録できない' do
          @user.password = '123456'
          @user.password_confirmation = '1234567'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it '重複したemailが存在する場合は登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
        it 'passwordが5文字以下では登録できない' do
          @user.password = '00000'
          @user.password_confirmation = '00000'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
        it 'emailは@を含まないと登録できない' do
          @user.email = 'testmail'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end
        it 'first_nameが空では登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
        it 'last_nameがからでは登録できない' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end
        it 'first_name2が空では登録できない' do
          @user.first_name2 = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name2 can't be blank")
        end
        it 'last_name_2が空では登録できない' do
          @user.last_name_2 = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name 2 can't be blank")
        end
        it 'first_nameが半角、ローマ字は登録できない' do
          @user.first_name = 'hoge1'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
        end
        it 'last_nameが半角、ローマ字は登録できない' do
          @user.last_name = 'hoge1'
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
        end
          it 'first_name2が半角、漢字、ひらがな、ローマ字は登録できない' do
            @user.first_name2 = 'hoge君'
            @user.valid?
            expect(@user.errors.full_messages).to include("First name2 全角カナで入力してください")
          end
          it 'last_name2が半角、漢字、ひらがな、ローマ字は登録できない' do
            @user.last_name_2 = 'hogeくん'
            @user.valid?
            expect(@user.errors.full_messages).to include("Last name 2 全角カナで入力してください")
          end
        it "date_of_birthが空だと登録できない" do
          @user.date_of_birth = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Date of birth can't be blank")
        end
      end



  end
end
