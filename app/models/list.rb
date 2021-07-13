class List < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_status
  belongs_to :delivery_burden
  belongs_to :prefecture
  belongs_to :shipping_day


  hann_suu = /\A[-]?[0-9]+(\.[0-9]+)?\z/



  with_options presence: true do
    
    validates :item_name
    validates :item_description
    validates :item_category_id
    validates :item_status_id
    validates :delivery_burden_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :item_price, numericality: {only_integer: true}




  end

  validates :item_category_id, :item_status_id, :delivery_burden_id, :prefecture_id, :shipping_day_id, numericality: { other_than: 1, message: "can't be blank"} 



end
