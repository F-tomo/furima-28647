# テーブル設計

## users テーブル

| Column          | Type   | Options                   |
| --------------- | ------ | ------------------------- |
| nickname        | string | null: false               |
| email           | string | null: false, unique: true |
| password        | string | null: false               |
| last_name       | string | null: false               |
| first_name      | string | null: false               |
| last_name_kana  | string | null: false               |
| first_name_kana | string | null: false               |
| birth_date      | date   | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column           | Type      | Options                           |
| ---------------- | --------- | --------------------------------- |
| discription      | text      | null: false                       |
| category_id      | integer   | null: false                       |
| condition_id     | integer   | null: false                       |
| postage_id       | integer   | null: false                       |
| prefecture_id    | integer   | null: false                       |
| hold_date_id     | integer   | null: false                       |
| price            | integer   | null: false                       |

### Association

- belongs_to :user
- has_one :purchase
- has_many :images
- belongs_to :category
- belongs_to :condition
- belongs_to :postage
- belongs_to :prefecture
- belongs_to :hold_date

## purchases テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| prefecture_id | integer    | null: false                    |
| post_code     | string     | null: false                    |
| city          | string     | null: false                    |
| address_line  | string     | null: false                    |
| building      | string     |                                |
| phone         | string     | null: false                    |
| purchases_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase
- belongs_to_active_hash