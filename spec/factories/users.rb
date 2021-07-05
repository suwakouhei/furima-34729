FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name                   {"諏訪"}
    last_name                    {"晃平"}
    first_name_katakana          {"スワ"}
    last_name_katakana           {"コウヘイ"}
    birthday                     {Faker::Date.birthday}
  end
end
