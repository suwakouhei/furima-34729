require 'rails_helper'

RSpec.describe List, type: :model do
  before do
    @list = FactoryBot.build(:list)
  end

  describe '出品登録' do
    context '新規登録がうまくいくとき' do
      it 'item_nameとitem_description、item_category_idとitem_status_id,delivery_burden_idとprefecture_id、shipping_day_idとitem_priceが存在するとき' do
        expect(@list).to be_valid
      end
    end

    context '出品登録がうまくいかないとき' do
      it '商品名が空のとき' do
        @list.item_name = ''
        @list.valid?
        expect(@list.errors.full_messages).to include("Item name can't be blank")
      end

      it '商品の説明がが空のとき' do
        @list.item_description = ''
        @list.valid?
        expect(@list.errors.full_messages).to include("Item description can't be blank")
      end

      it 'カテゴリーの情報が空のとき' do
        @list.item_category_id = ''
        @list.valid?
        expect(@list.errors.full_messages).to include("Item category can't be blank")
      end

      it 'カテゴリーの選択欄でidに1が選択されている場合は出品できない' do
        @list.item_category_id = '1'
        @list.valid?
        expect(@list.errors.full_messages).to include("Item category can't be blank")
      end

      it '商品の状態についての情報が空のとき' do
        @list.item_status_id = ''
        @list.valid?
        expect(@list.errors.full_messages).to include("Item status can't be blank")
      end

      it '商品の状態の選択欄でidに1が選択されている場合は出品できない' do
        @list.item_status_id = '1'
        @list.valid?
        expect(@list.errors.full_messages).to include("Item status can't be blank")
      end

      it '配送料の負担についての情報が空のとき' do
        @list.delivery_burden_id = ''
        @list.valid?
        expect(@list.errors.full_messages).to include("Delivery burden can't be blank")
      end

      it '配送料の負担の選択欄でidに1が選択されている場合は出品できない' do
        @list.delivery_burden_id = '1'
        @list.valid?
        expect(@list.errors.full_messages).to include("Delivery burden can't be blank")
      end

      it '発送元の地域についての情報が空のとき' do
        @list.prefecture_id = ''
        @list.valid?
        expect(@list.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送元の地域の選択欄でidに1が選択されている場合は出品できない' do
        @list.prefecture_id = '1'
        @list.valid?
        expect(@list.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送までの日数についての情報が空のとき' do
        @list.shipping_day_id = ''
        @list.valid?
        expect(@list.errors.full_messages).to include("Shipping day can't be blank")
      end

      it '発送までの日数の選択欄でidに1が選択されている場合は出品できない' do
        @list.shipping_day_id = '1'
        @list.valid?
        expect(@list.errors.full_messages).to include("Shipping day can't be blank")
      end

      it '販売価格についての情報が必須が空のとき' do
        @list.item_price = ''
        @list.valid?
        expect(@list.errors.full_messages).to include("Item price can't be blank")
      end

      it '商品価格が半角英数字混合では出品できない' do
        @list.item_price = 'aa11'
        @list.valid?
        expect(@list.errors.full_messages).to include('Item price is not a number')
      end

      it '商品価格が半角英字のみでは出品できない' do
        @list.item_price = 'aa'
        @list.valid?
        expect(@list.errors.full_messages).to include('Item price is not a number')
      end

      it '商品価格が全角文字では出品できない' do
        @list.item_price = 'ああ'
        @list.valid?
        expect(@list.errors.full_messages).to include('Item price is not a number')
      end

      it '商品価格が299円以下では出品できない' do
        @list.item_price = '289'
        @list.valid?
        expect(@list.errors.full_messages).to include('Item price must be greater than 299')
      end

      it '商品価格が10_000_000円以上では出品できない' do
        @list.item_price = '10000000000'
        @list.valid?
        expect(@list.errors.full_messages).to include('Item price must be less than 10000000')
      end

      it 'userが紐付いていなければ出品できない' do
        @list.user = nil
        @list.valid?
        expect(@list.errors.full_messages).to include('User must exist')
      end

      it '画像が紐付いていない場合は登録できない' do
        @list.image = nil
        @list.valid?
        expect(@list.errors.full_messages).to include('Image must exist')
      end

    end
  end
end
