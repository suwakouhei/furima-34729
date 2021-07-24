class PurchaseStreetAdress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number, :list_id, :user_id

  with_options presence: true do
    validates :postal_code 
    validates :prefectures_id 
    validates :municipality 
    validates :address 
    validates :phone_number
    validates :user_id
    validates :list_id
  end
end
