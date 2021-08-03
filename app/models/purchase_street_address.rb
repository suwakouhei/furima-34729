class PurchaseStreetAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number, :list_id, :user_id, :token

  with_options presence: true do
    validates :postal_code
    validates :prefectures_id
    validates :municipality
    validates :address
    validates :phone_number
    validates :user_id
    validates :list_id
    validates :token
  end
  def save
    purchase = Purchase.create(user_id: user_id, list_id: list_id)
    StreetAddress.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality, address: address,
                         phone_number: phone_number)
  end
end
