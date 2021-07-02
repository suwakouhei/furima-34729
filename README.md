# テーブル設計


## usersテーブル

| Column                | Type          | Options                      |
|-----------------------|---------------|------------------------------|
| nickname              | string        | null: false                  |
| email                 | string        | null: false, unique: true    |
| encrypted_password    | string        | null: false                  |
| first_name            | string        | null: false                  |
| last_name(katakana)   | string        | null: false                  |
| first_name(katakana)  | string        | null: false                  |
| last_name             | string        | null: false                  |
| birthday              | date          | null: false                  |


### Association

- has_many :lists
- has_many :purchases


## listsテーブル

| Column                | Type          | Options                          |
|-----------------------|---------------|----------------------------------|
| item_name             | string        | null: false                      |
| item_description      | string        | null: false                      |
| item_category_id      | integer       | null: false                      |
| item_status           | integer       | null: false                      |
| delivery_burden       | integer       | null: false                      |
| prefectures           | integer       | null: false                      |
| shipping_days         | integer       | null: false                      |
| item_price            | integer       | null: false                      |
| user                  | references    | null: false, foreign_key :true   |

- belongs_to :user
- has_one :purchase


## purchasesテーブル

| Column                | Type          | Options                          |
|-----------------------|---------------|----------------------------------|
| user                  | references    | null: false, foreign_key :true   |
| list                  | references    | null: false, foreign_key :true   |

- belongs_to :user
- belongs_to :list
- has_one :street_address


## street_addressテーブル

| Column                | Type          | Options                          |
| postal_code           | string        | null: false                      |
| prefectures           | integer       | null: false                      |
| municipality          | string        | null: false                      |
| address               | integer       | null: false                      |
| building_name         | string        |                                  |
| phone_number          | string        | null: false                      |
| purchase              | references    | null: false, foreign_key :true   |

- belongs_to :purchase
