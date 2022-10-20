# テーブル設計

## users テーブル

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false  unique: true |
| nickname           | string              | null: false               |
| first_name         | text                | null: false               |
| last_name          | text                | null: false               |
| date               | text                | null: false               |


## contents テーブル

| Column           | Type       | Options                        |
| -----------------| -----------| -------------------------------|
| title            | string     | null: false                    |
| item             | text       | null: false                    |
| item_price       | integer    | null: false,                   |
| item_explain     | text       | null: false,                   |
| item_name        | text       | null: false,                   |
| item_category    | text       | null: false,                   |
| item_situation   | text       | null: false,                   |
| delivery_charge  | text       | null: false,                   |
| shipping_area    | text       | null: false,                   |
| date_of_shipment | text       | null: false,                   |
| users_id         | text       | null: false,foreign_key: true  |


## purchase テーブル

| Column      | Type       | Options                           |
| ----------- | ---------- | --------------------------------- |
| buyer       | text       | null: false                       |
| item        | text       | null: false                       |
| users_id    | text       | null: false,foreign_key: true     |
| contents_id | text       | null: false,foreign_key: true     |


## shipping テーブル

| Column              | Type       | Options                           |
| ------------------- | ---------- | --------------------------------- |
| post_code           | text       | null: false                       |
| prefecture_id       | integer    | null: false                       |
| municipality        | string     | null: false                       |
| address             | string     | null: false                       |
| building            | string     |                                   |
| phone_number        | string     | null: false                       |
| purchase            | references | null: false,foreign_key: true     |


