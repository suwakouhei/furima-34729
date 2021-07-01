# テーブル設計


## usersテーブル

| Column                | Type          | Options        |
|-----------------------|---------------|----------------|
| nickname              | string        | null: false    |
| email                 | string        | null: false    |
| password              | string        | null: false    |
| name                  | string        | null: false    |
| birthday              | integer       | null: false    |


### Association

- has_many :lists
- has_many :purchases

## listsテーブル

| Column                | Type          | Options                          |
|-----------------------|---------------|----------------------------------|
| image                 | string        | null: false                      |
| item_name             | string        | null: false                      |
| delivery              | string        | null: false                      |
| item_price            | integer       | null: false                      |
| user                  | references    | null: false, foreign_key :true   |

- belongs_to :users
- has_one :purchases

## purchasesテーブル

| Column                | Type          | Options                          |
|-----------------------|---------------|----------------------------------|
| credit_card           | integer       | null: false                      |
| delivery              | string        | null: false                      |
| user                  | references    | null: false, foreign_key :true   |

- belongs_to :users
- belongs_to :lists
