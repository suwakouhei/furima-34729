require 'rails_helper'

RSpec.describe PurchaseStreetAddress, type: :model do
  before do
    user = @user
    list = @list
    @purchase_street_address = FactoryBot.build(:purchase_street_address, user_id: :user , list_id: :list)
  end

  context '内容に問題ない場合' do
    it '全ての情報が保存ができるとき' do
      expect(@purchase_street_address).to be_valid
    end

    it 'building_nameが空でも購入できる' do
      @purchase_street_address.building_name = ''
      expect(@purchase_street_address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it '郵便番号が空では登録できないこと' do
      @purchase_street_address.postal_code = ''
      @purchase_street_address.valid?
      expect(@purchase_street_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号はハイフン無しでは登録できないこと' do
      @purchase_street_address.postal_code = '1650033'
      @purchase_street_address.valid?
      expect(@purchase_street_address.errors.full_messages).to include('Postal code is invalid')
    end

    it '都道府県が空では登録できないこと' do
      @purchase_street_address.prefectures_id = ''
      @purchase_street_address.valid?
      expect(@purchase_street_address.errors.full_messages).to include("Prefectures can't be blank")
    end

    it '都道府県の項目で1以上のidが選択されないと保存できないこと' do
      @purchase_street_address.prefectures_id = '1'
      @purchase_street_address.valid?
      expect(@purchase_street_address.errors.full_messages).to include("Prefectures can't be blank")
    end

    it '市区町村が空では登録できないこと' do
      @purchase_street_address.municipality = ''
      @purchase_street_address.valid?
      expect(@purchase_street_address.errors.full_messages).to include("Municipality can't be blank")
    end

    it '番地が空では登録できないこと' do
      @purchase_street_address.address = ''
      @purchase_street_address.valid?
      expect(@purchase_street_address.errors.full_messages).to include("Address can't be blank")
    end

    it '電話番号が空では購入できないこと' do
      @purchase_street_address.phone_number = ''
      @purchase_street_address.valid?
      expect(@purchase_street_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号は11桁以内でないと購入できないこと' do
      @purchase_street_address.phone_number = '090123456789'
      @purchase_street_address.valid?
      expect(@purchase_street_address.errors.full_messages).to include('Phone number is invalid')
    end

    it '電話番号は半角数字のみでないと購入できないこと' do
      @purchase_street_address.phone_number = '０９０１２３４５６７８'
      @purchase_street_address.valid?
      expect(@purchase_street_address.errors.full_messages).to include('Phone number is invalid')
    end

    it 'tokenが空では登録できないこと' do
      @purchase_street_address.phone_number = ''
      @purchase_street_address.valid?
      expect(@purchase_street_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'user_idが空だと購入できない' do
      @purchase_street_address.user_id = ''
      @purchase_street_address.valid?
      expect(@purchase_street_address.errors.full_messages).to include("User can't be blank")
    end

    it 'list_idが空だと購入できない' do
      @purchase_street_address.list_id = ''
      @purchase_street_address.valid?
      expect(@purchase_street_address.errors.full_messages).to include("List can't be blank")
    end
  end
end
