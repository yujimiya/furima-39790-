# README
# usersテーブル
| Column               | Type   | Option                    |
|----------------------|--------|---------------------------|
| nickname             | string | null: false               |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false               |
| encrypted_password   | string | null: false               |
| last_name            | string | null:false  |
| first_name           | string | null:false  |
| last_name_kana       | string | null:false  |
| first_name_kana      | string | null:false  |
| birthday             | date   | null:false  |

has_many: items
has_many: purchases

# itemsテーブル
| Column            | Type       | Option                  |
|-------------------|------------|--------------------------|
| image             | text       | null:false               |
| item_name         | text       | null:false               |
| item_content      | text       | null:false               |
| category_id       | integer    | null:false               |
| situation_id      | integer    | null:false               |
| charge_id         | integer    | null:false               |
| sipping_id        | integer    | null:false               |
| date_id           | integer    | null:false               |
| price             | integer    | null:false                   |
| user              | references | foreign_key: true, null:false|

belongs_to: user
has_one: purchase

# purchasesテーブル
| Column             | Type       | Option           |
|--------------------|------------|------------------|
| items              | references | foreign_key: true|
| user               | references | foreign_key: true|

belongs_to: user
belongs_to: item
has_one: delivery

# deliveriesテーブル

| Column             | Type           | Option        |
|--------------------|----------------|---------------|
| post_code          | integer        | null:false    |
| prefecture_id      | integer        | null:false    |
| street_number      | text           | null:false    |
| building_name      | text           | null:false    |
| phon_number        | integer        | null:false    |

belongs_to: purchase
