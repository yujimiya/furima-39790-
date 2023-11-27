# README
# usersテーブル
| Column               | Type   | Option      |
|----------------------|--------|-------------|
| nickname             | string | null: false |
| email                | string | null: false |
| password             | string | null: false |
| password confirmation| string | null:false  |
| last_name            | string | null:false  |
| first_name           | string | null:false  |
| last_name_kana       | string | null:false  |
| first_name_kana      | string | null:false  |
| birthday             | integer| null:false  |

has_many: items
has_many: purchases

# itemsテーブル
| Column            | Type       | Option           |
|-------------------|------------|------------------|
| category          | text       | null:false       |
| situation         | text       | null:false       |
| charge            | integer    | null:false       |
| sipping           | text       | null:false       |
| date              | text       | null:false       |
| user_id           | references | foreign_key: true|

belongs_to: user
has_one: purchase

# purchasesテーブル
| Column             | Type       | Option           |
|--------------------|------------|------------------|
| items_id           | references | foreign_key: true|
| user_id            | references | foreign_key: true|

belongs_to: user
belongs_to: item
has_one: delivery

# deliverysテーブル

| Column             | Type           | Option        |
|--------------------|----------------|---------------|
| post_code          | integer        | null:false    |
| prefecture         | text           | null:false    |
| street_number      | text           | null:false    |

belongs_to: purchase
