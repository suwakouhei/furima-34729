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

  it "tokenが空では登録できないこと" do
    @purchase_street_address.token = nil
    @purchase_street_address.valid?
    expect(@purchase_street_address.errors.full_messages).to include("Token can't be blank")
  endit "tokenが空では登録できないこと" do
    @purchase_street_address.token = nil
    @purchase_street_address.valid?
    expect(@purchase_street_address.errors.full_messages).to include("Token can't be blank")
  endit "tokenが空では登録できないこと" do
    @purchase_street_address.token = nil
    @purchase_street_address.valid?
    expect(@purchase_street_address.errors.full_messages).to include("Token can't be blank")
  endit "tokenが空では登録できないこと" do
    @purchase_street_address.token = nil
    @purchase_street_address.valid?
    expect(@purchase_street_address.errors.full_messages).to include("Token can't be blank")
  endit "tokenが空では登録できないこと" do
    @purchase_street_address.token = nil
    @purchase_street_address.valid?
    expect(@purchase_street_address.errors.full_messages).to include("Token can't be blank")
  end
  it "tokenが空では登録できないこと" do
    @purchase_street_address.token = nil
    @purchase_street_address.valid?
    expect(@purchase_street_address.errors.full_messages).to include("Token can't be blank")
  end
end

end

