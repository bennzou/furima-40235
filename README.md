# テーブル設計

## users テーブル
| Column                | Type   | Options     |
| -----------           | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false,unique: true|
| encrypted_password    | string | null: false |
| first_name            | string | null: false |
| last_name             | string | null: false |
| first-name-kana       | string | null: false |
| last-name-kana        | string | null: false |
| birth-date            | date   | null: false |

### Association


- has_many :items
- has_many :addresss
- has_many :comments

## items テーブル
| Column                     | Type       | Options     |
| ---------------------------| ---------- | ----------- |
| item_name                  | string     | null: false |
| item-info                  | text       | null: false |
| item-category              | integer    | null: false |
| item-sales-status          | integer    | null: false |
| item-shipping-fee-status   | integer    | null: false |
| item-prefecture            | integer    | null: false |
| item-scheduled-delivery    | integer    | null: false |
| item-price                 | integer    | null: false |
| user     | references | null: false,foreign_key: true | 


### Association

- belongs_to :user
- has_one  :address
- has_many :comments
- belongs_to_active_hash :item-category_id
- belongs_to_active_hash :item-sales-status_id
- belongs_to_active_hash :item-shipping-fee-status_id
- belongs_to_active_hash :item-prefecture_id 
- belongs_to_active_hash :item-scheduled-delivery_id


## comments テーブル
| Column        | Type       | Options                        |
| ------------- | -------    | ------------------------------ |
| image         |            | null: false,                   |
| comment       | text       | null: false                    |                 
| user          | references | null: false ,foreign_key: true | 
| item          | references | null: false ,foreign_key: true | 

### Association

- belongs_to :user
- belongs_to :item


## addresss テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| street_address| string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| user          | reference  | null: false, foreign_key: true |
| item          | reference  | null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :item
- has_one_active_hash :prefecture_id
