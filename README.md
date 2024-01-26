# テーブル設計

## users テーブル
| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| nickname    | string | null: false |
| email       | string | null: false |
| password    | string | null: false |
| first_name  | string | null: false |
| last_name   | string | null: false |
| read_first  | string | null: false |
| read_family | string | null: false |
| birthday    | integer| null: false |

### Association

- has_many :address
- has_many :items
- has_many :cards
- has_many :comments

## items テーブル
| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| item_name           | text       | null: false |
| name_explanation    | text       | null: false |
| category            | string     | null: false |
| condition           | string     | null: false |
| postage             | string     | null: false |
| aria                | string     | null: false |
| days                | string     | null: false |
| price               | integer    | null: false |
| user                | references | null: false ,foreign_key: true | 


### Association

- belongs_to :user
- has_many :items
- has_many :comments
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :postage
- belongs_to_active_hash :aria
- belongs_to_active_hash :days


## comments テーブル
| Column        | Type       | Options                        |
| ------------- | -------    | ------------------------------ |
| image         |            | null: false,                   |
| comment       | text       | null: false                    |                 
| user          | references | null: false ,foreign_key: true | 
| item          | references | null: false ,foreign_key: true | 

### Association

- belongs_to :user
- has_one :item

## cards テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| card_number      | string     | null: false           |
| invalid          | string     | null: false           | 
| security_code    | string     | null: false           | 
| user    | integer    | null: false, foreign_key: true |
| address | integer    | null: false, foreign_key: true |

### Association

- belongs_to :address
- belongs_to :user
- has_one :address

## addresss テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefectures   | integer    | null: false, foreign_key: true |
| street_address| string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| item_purchase | integer    | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :cards
- has_one_active_hash :prefectures
- has_one :card