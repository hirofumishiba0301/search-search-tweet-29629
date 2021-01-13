# README


## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| birthday           | date   | null: false |
| nickname           | string | null: false |
| last-name          | string | null: false |
| first-name         | string | null: false |
| last-name-kana     | string | null: false |
| first-name-kana    | string | null: false |

### Association
- has_many :favorites
- has_many :files
- has_many :articles
- has_many :todos
- has_many :goodjobs
- has_many :followers

## articles テーブル

| Column          | Type       | Options                        |
| --------------- | -----------| ------------------------------ |
| name            | text       | null: false                    |
| user            | references | foreign_key: true              |
| file            | references | foreign_key: true              |
| info            | text       | null: false                    |
| favorite_counts | integer    |                                |
| goodjob_counts  | integer    |                                |
|                 | integer    |                                |

### Association
- belongs_to :user
- has_many :todos
- belongs_to :goojob
- belongs_to :file
- belongs_to :favorite

## todos テーブル

| Column          | Type       | Options                        |
| --------------- | -----------| ------------------------------ |
| tweet           | text       | null: false                    |
| user            | references | foreign_key: true              |
| article         | references | foreign_key: true              |

### Association
- belongs_to :user
- belongs_to :article

## goodjobs テーブル

| Column          | Type       | Options                        |
| --------------- | -----------| ------------------------------ |
| user            | references | foreign_key: true              |
| article         | references | foreign_key: true              |

### Association
- belongs_to :user
- has_many :articles

## favorites テーブル

| Column          | Type       | Options                        |
| --------------- | -----------| ------------------------------ |
| user            | references | foreign_key: true              |
| article         | references | foreign_key: true              |

### Association
- belongs_to :user
- has_many :articles

## followers テーブル

| Column          | Type       | Options                        |
| --------------- | -----------| ------------------------------ |
| user            | references | foreign_key: true              |

### Association
- belongs_to :user

## テーブル
### Association

## テーブル
### Association


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
