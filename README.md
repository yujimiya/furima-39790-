# README
# usersテーブル
| Column               | Type   | Option                    |
|----------------------|--------|---------------------------|
| nickname             | string | null: false               |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false               |
| last_name            | string | null:false                |
| first_name           | string | null:false                |
| last_name_kana       | string | null:false                |
| first_name_kana      | string | null:false                |
| birthday             | date   | null:false                |

has_many: items
has_many: purchases

# itemsテーブル
| Column            | Type       | Option                       |
|-------------------|------------|------------------------------|
| item_name         | string     | null:false                   |
| item_content      | text       | null:false                   |
| category_id       | integer    | null:false                   |
| situation_id      | integer    | null:false                   |
| charge_id         | integer    | null:false                   |
| prefecture_id     | integer    | null:false                   |
| shipping_date_id  | integer    | null:false                   |
| price             | integer    | null:false                   |
| user              | references | foreign_key: true, null:false|

belongs_to: user
has_one: purchase

# purchasesテーブル
| Column             | Type       | Option                        |
|--------------------|------------|-------------------------------|
| item               | references | null: false, foreign_key: true|
| user               | references | null: false, foreign_key: true|

belongs_to: user
belongs_to: item
has_one: delivery

# deliveriesテーブル

| Column             | Type           | Option                       |
|--------------------|----------------|------------------------------|
| post_code          | string         | null:false                   |
| prefecture_id      | integer        | null:false                   |
| city               | string         | null:false                   |
| street_number      | string         | null:false                   |
| building_name      | string         |                              |
| phon_number        | string         | null:false                   |
| purchase           | references     | null:false, foreign_key: true|

belongs_to: purchase
