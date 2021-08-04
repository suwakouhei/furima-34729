FactoryBot.define do
  factory :purchase_street_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '165-0033' }
    prefectures_id { 2 }
    municipality { '横浜市' }
    address { '青山1-1-1' }
    phone_number { '09012345678' }
    user_id { 1 }
    list_id { 2 }
    building_name { '柳' }
  end
end
