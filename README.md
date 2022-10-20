# テーブル設計

## users テーブル

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| password           | string              | null: false  unique: true |
| nickname           | string              | null: false               |
| first-name         | text                | null: false               |
| last-name          | text                | null: false               |
| date-of-birth      | text                | null: false               |


## contents テーブル

| Column           | Type       | Options                        |
| -----------------| -----------| -------------------------------|
| title            | string     | null: false                    |
| item             | text       | null: false                    |
| img              | text       | null: false                    |
| item-price       | text       | null: false,                   |
| item-explain     | text       | null: false,                   |
| item-name        | text       | null: false,                   |
| item-category    | text       | null: false,                   |
| item-situation   | text       | null: false,                   |
| delivery-charge  | text       | null: false,                   |
| shipping-area    | text       | null: false,                   |
| date-of-shipment | text       | null: false,                   |
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
| post-code           | text       | null: false                       |
| prefectures         | text       | null: false                       |
| municipality        | text       | null: false                       |
| address             | text       | null: false                       |
| building            | text       | null: false                       |
| phone-number        | text       | null: false                       |
| users_id            | text       | null: false,foreign_key: true     |
| purchase_id         | text       | null: false,foreign_key: true     |


