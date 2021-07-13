FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name                   { '晃平' }
    last_name                    { '諏訪' }
    first_name_katakana          { 'コウヘイ' }
    last_name_katakana           { 'スワ' }
    birthday                     { Faker::Date.birthday }
  end
end
