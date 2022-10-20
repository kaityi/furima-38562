# テーブル設計

## users テーブル

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| nickname           | string              | null: false               |
| first_name         | string              | null: false               |
| last_name          | string              | null: false               |
| first_name_2       | string              | null: false               |
| last_name_2        | string              | null: false               |
| date_of_birth      | date                | null: false               |


## contents テーブル

| Column              | Type       | Options                        |
| --------------------| -----------| -------------------------------|
| item_price          | integer    | null: false,                   |
| item_explain        | integer    | null: false,                   |
| item_category_id    | integer    | null: false,                   |
| item_situation_id   | integer    | null: false,                   |
| delivery_charge_id  | integer    | null: false,                   |
| shipping_area_id    | integer    | null: false,                   |
| date_of_shipment_id | integer    | null: false,                   |
| user                | references | null: false,foreign_key: true  |


## purchases テーブル

| Column      | Type       | Options                           |
| ----------- | ---------- | --------------------------------- |
| user        | references | null: false,foreign_key: true     |
| content    | references | null: false,foreign_key: true     |


## shipping テーブル

| Column              | Type       | Options                           |
| ------------------- | ---------- | --------------------------------- |
| post_code           | string     | null: false                       |
| prefecture_id       | integer    | null: false                       |
| municipality        | string     | null: false                       |
| address             | string     | null: false                       |
| building            | string     |                                   |
| phone_number        | string     | null: false                       |
| purchase            | references | null: false,foreign_key: true     |

## Association

- belongs_to :shipping
- belongs_to :purchases
- belongs_to :users
- belongs_to :contents
