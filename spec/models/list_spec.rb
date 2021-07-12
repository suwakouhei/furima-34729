require 'rails_helper'

RSpec.describe List, type: :model do
  before do
    @list = FactoryBot.build(:list)
  end

  before do
    @user = FactoryBot.build(:user)
  end

  describe '出品登録' do

    context '新規登録がうまくいくとき' do

      it "item_nameとitem_description、item_category_idとitem_status_id,delivery_burden_idとprefecture_id、shipping_day_idとitem_priceが存在するとき" do
        expect(@list).to be_valid
    
      end

    end

    context '出品登録がうまくいかないとき' do

      it "商品名が必須でないとき" do
        @list.item_name = ""
        @list.valid?
        expect(@list.errors.full_messages).to include("Item name can't be blank")
      end

      it "商品の説明が必須でないとき" do
        @list.item_description = ""
        @list.valid?
        expect(@list.errors.full_messages).to include("Item description can't be blank")
      end

      it "カテゴリーの情報が必須でないとき" do
        @list.item_category_id = ''
        @list.valid?
        expect(@list.errors.full_messages).to include("Item category can't be blank")
      end

      it "商品の状態についての情報が必須でないとき" do
        @list.item_status_id = ''
        @list.valid?
        expect(@list.errors.full_messages).to include("Item status can't be blank")
      end

      it "配送料の負担についての情報が必須でないとき" do
        @list.delivery_burden_id = ''
        @list.valid?
        expect(@list.errors.full_messages).to include("Delivery burden can't be blank")
      end

      it "発送元の地域についての情報が必須でないとき" do
        @list.prefecture_id = ''
        @list.valid?
        expect(@list.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "発送までの日数についての情報が必須でないとき" do
        @list.shipping_day_id = ''
        @list.valid?
        expect(@list.errors.full_messages).to include("Shipping day can't be blank")
      end

      it "販売価格についての情報が必須でないとき" do
        @list.item_price = ''
        @list.valid?
        expect(@list.errors.full_messages).to include("Item price can't be blank")
      end

      
    end





  
  end

end
