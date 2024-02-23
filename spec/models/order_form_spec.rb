require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: user.id,item_id: item.id)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_form).to be_valid
      end

      it "tokenがあれば保存ができること" do
        expect(@order_form).to be_valid
      end

      it '郵便番号が「3桁＋ハイフン＋4桁」の組み合わせであれば保存できる' do
        @order_form.post_code = '123-4560'
        expect(@order_form).to be_valid
      end

      it '建物名がなくても保存できること' do
        @order_form.building = ''  
        expect(@order_form).to be_valid
      end

    end
    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
    
      it 'item_idが空だと保存できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
    
      it '郵便番号が空だと保存できないこと' do
        @order_form.post_code = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code can't be blank")
      end
    
      it '郵便番号にハイフンがないと保存できないこと' do
        @order_form.post_code = 1234567
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
    
      it '都道府県が「---」だと保存できないこと' do
        @order_form.item_prefecture_id = 0
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item prefecture can't be blank")
      end
    
      it '都道府県が空だと保存できないこと' do
        @order_form.item_prefecture_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item prefecture can't be blank")
      end
    
      it '市区町村が空だと保存できないこと' do
        @order_form.city = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
    
      it '番地が空だと保存できないこと' do
        @order_form.block = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Block can't be blank")
      end
    
      it '電話番号が空だと保存できないこと' do
        @order_form.phone_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
    
      it '電話番号にハイフンがあると保存できないこと' do
        @order_form.phone_number = '123-1234-1234'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end
    
      it '電話番号が12桁以上あると保存できないこと' do
        @order_form.phone_number = '1234567890123'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end
    
      it '電話番号が9桁以下では保存できないこと' do
        @order_form.phone_number = '12345678'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end

      it 'トークンが空だと保存できないこと' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end