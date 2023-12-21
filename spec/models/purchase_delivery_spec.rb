require 'rails_helper'

RSpec.describe PurchaseDelivery, type: :model do
  describe '商品購入機能' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @purchase = FactoryBot.build(:purchase_delivery, user_id: @user.id, item_id: @item.id)
    end
    context '内容に問題がない場合' do
      it '全ての値が正しく入力されていれば購入できること' do
        expect(@purchase).to be_valid
      end
      it 'building_nameが空でも購入できること' do
        @purchase.building_name = '' 
        expect(@purchase).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'post_codeが空だと購入できないこと' do
        @purchase.post_code = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角でハイフンを含んだ正しい形式でないと購入できないこと' do
        @purchase.post_code = '12345'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'cityが空だと購入できないこと' do
        @purchase.city = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City can't be blank")
      end
      it 'street_numberが空だと購入できないこと' do
        @purchase.street_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Street number can't be blank")
      end
      it 'phone_numberが空だと購入できないこと' do
        @purchase.phone_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10桁か11桁の半角でないと購入できないこと' do
        @purchase.phone_number = '1234567891011'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Phone number is Invalid')
      end
      it 'prefectureが選択しないと購入できないこと' do
        @purchase.prefecture_id = 1
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Prefecture Please select')
      end
      it 'userが紐づいていないと購入できないこと' do
        @purchase.user_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと購入できないこと' do
        @purchase.item_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
