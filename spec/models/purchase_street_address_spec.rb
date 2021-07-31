require 'rails_helper'

RSpec.describe PurchaseStreetAddress, type: :model do

before do
  @purchase_street_address = FactoryBot.build(:purchase_street_address)
end

context '内容に問題ない場合' do
  it "全ての情報が保存ができるとき" do
    expect(@purchase_street_address).to be_valid
  end
end

context '内容に問題がある場合' do

  it "郵便番号が空では登録できないこと" do
    @purchase_street_address.postal_code = ""
    @purchase_street_address.valid?
    expect(@purchase_street_address.errors.full_messages).to include("Postal code can't be blank")
  end
  
  it "都道府県が空では登録できないこと" do
    @purchase_street_address.prefectures_id = ""
    @purchase_street_address.valid?
    expect(@purchase_street_address.errors.full_messages).to include("Prefectures can't be blank")
  end
  
  it "市区町村が空では登録できないこと" do
    @purchase_street_address.municipality = ""
    @purchase_street_address.valid?
    expect(@purchase_street_address.errors.full_messages).to include("Municipality can't be blank")
  end
  
  it "番地が空では登録できないこと" do
    @purchase_street_address.address = ""
    @purchase_street_address.valid?
    expect(@purchase_street_address.errors.full_messages).to include("Address can't be blank")
  end
  
  it "tokenが空では登録できないこと" do
    @purchase_street_address.phone_number = ""
    @purchase_street_address.valid?
    expect(@purchase_street_address.errors.full_messages).to include("Phone number can't be blank")
  end

end

end

