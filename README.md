# テーブル設計


## usersテーブル

| Column                | Type          | Options                      |
|-----------------------|---------------|------------------------------|
| nickname              | string        | null: false                  |
| email                 | string        | null: false, unique: true    |
| encrypted_password    | string        | null: false                  |
| last_name             | string        | null: false                  |
| first_name            | string        | null: false                  |
| last_name_katakana    | string        | null: false                  |
| first_name_katakana   | string        | null: false                  |
| birthday              | date          | null: false                  |


### Association

- has_many :lists
- has_many :purchases


## listsテーブル

| Column                | Type          | Options                          |
|-----------------------|---------------|----------------------------------|
| item_name             | string        | null: false                      |
| item_description      | text          | null: false                      |
| item_category_id      | integer       | null: false                      |
| item_status_id        | integer       | null: false                      |
| delivery_burden_id    | integer       | null: false                      |
| prefectures_id        | integer       | null: false                      |
| shipping_days_id      | integer       | null: false                      |
| item_price            | integer       | null: false                      |
| user                  | references    | null: false, foreign_key :true   |

### Association

- belongs_to :user
- has_one :purchase


## purchasesテーブル

| Column                | Type          | Options                          |
|-----------------------|---------------|----------------------------------|
| user                  | references    | null: false, foreign_key :true   |
| list                  | references    | null: false, foreign_key :true   |

### Association

- belongs_to :user
- belongs_to :list
- has_one :street_address


## street_addressesテーブル

| Column                | Type          | Options                          |
| postal_code           | string        | null: false                      |
| prefectures_id        | integer       | null: false                      |
| municipality          | string        | null: false                      |
| address               | string        | null: false                      |
| building_name         | string        |                                  |
| phone_number          | string        | null: false                      |
| purchase              | references    | null: false, foreign_key :true   |

### Association

- belongs_to :purchase
