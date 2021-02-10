# README

# search-search-tweet-29629

# アプリケーション概要
- ブログ形式のアプリケーションです。
- Mark down書式による記事投稿機能とツイート機能があります。
- エンジニアが日々の情報収集している事をツイートして、記事にして整理するためのアプリケーションです。

## アプリケーションURL
- https://search-search-tweet-29629.herokuapp.com/articles
- id: admin
- pass: 29629

## テスト用アカウント
- id: dd@icloud.com
- password: ddddddd2

## 利用方法
- 

## 目指した課題解決
- 

## 洗い出した要件
- 

## 実装した機能
- 

## 実装予定の機能
- 

## データベース設計(ER図)
- 

## ローカルでの動作方法
- Ruby ver.
- 





## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| birthday           | date    | null: false |
| nickname           | string  | null: false |
| follower_counts    | integer |             |


### Association
- has_many :favorites
- has_many :files
- has_many :articles
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
| progress        | integer    | default: 0                     |

### Association
- belongs_to :user
- belongs_to :goojob
- belongs_to :file
- belongs_to :favorite

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

## relations テーブル

| Column          | Type       | Options                        |
| --------------- | -----------| ------------------------------ |
| follow_id       | integer    |                                |
| follower_id     | integer    |                                |

### Association
- belongs_to :follower, class_name: "User"
- belongs_to :follow, class_name: "User"

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
