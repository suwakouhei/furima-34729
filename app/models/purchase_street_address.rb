class PurchaseStreetAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number, :list_id, :user_id, :token

  haihun = /[0-9]{3}-[0-9]{4}/
  denwa = /\A\d{11}\z/
  
  with_options presence: true do
    validates :postal_code, format: { with: haihun }
    validates :prefectures_id,numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality
    validates :address
    validates :phone_number, format: { with: denwa }
    validates :user_id
    validates :list_id
    validates :token
  end
  def save
    purchase = Purchase.create(user_id: user_id, list_id: list_id)
    StreetAddress.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality, address: address,
                         phone_number: phone_number,purchase_id: purchase.id)
  end
end
