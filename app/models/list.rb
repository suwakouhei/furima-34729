class List < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_status
  belongs_to :delivery_burden
  belongs_to :prefecture
  belongs_to :shipping_day

  with_options presence: true do
    
    validates :item_name
    validates :item_description
    validates :item_category_id
    validates :item_status_id
    validates :delivery_burden_id
    validates :prefectures_id
    validates :shipping_days_id
    validates :item_price




  end

  validates :item_category_id, :item_status_id, :delivery_burden_id, :prefectures_id, :shipping_days_id, numericality: { other_than: 1, message: "can't be blank"} 



end
