FactoryBot.define do
  factory :list do
    item_name     {"test"}
    item_description   {"testtest"}
    item_category_id {2}
    item_status_id {2}
    delivery_burden_id {2}
    prefecture_id {2}
    shipping_day_id {2}
    item_price {1000}
    association :user 
    
  end
end
