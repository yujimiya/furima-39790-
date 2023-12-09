require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品する' do
    context '商品を出品できる場合' do
      it 'すべての項目を入力すれば投稿できる' do
        expect(@item).to be_valid
      end
    end
    context '商品を出品できない場合' do
      it '商品名が空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品説明が空では登録できない' do
        @item.item_content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item content can't be blank")
      end
      it '販売価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格は299円以下では出品できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Please enter a valid price between 300 and 9,999,999')
      end
      it '商品価格が10_000_000円以上では出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Please enter a valid price between 300 and 9,999,999')
      end
      it 'カテゴリーを選択しなければ出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Please select')
      end
      it '商品の状態を選択しなけらば登録できない' do
        @item.situation_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Situation Please select')
      end
      it '配送料の負担を選択しなければ登録できない' do
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Charge Please select')
      end
      it '発送元の地域を選択しなければ登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture Please select')
      end
      it '発送までの日数を選択しなければ登録できない' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping date Please select')
      end
      it 'userが紐づいていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it '画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
