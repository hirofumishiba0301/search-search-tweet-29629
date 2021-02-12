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
- ログイン→記事投稿→タイトル/タグ/本文記入→下書きから記事投稿に変更→投稿
- トップページの記事をクリック→記事詳細クリック→goodをクリック→しおりクリック
- ユーザーの写真クリック→フォローボタンクリック

## 目指した課題解決
- MD書式で情報収集した内容をまとめる
- 日々の情報収集活動をつぶやく
- 他の人と情報収集活動を共有したい

## 洗い出した要件
- MD書式による記事投稿機能で情報を整理する
- 気になる記事を保存しておける機能
- 参考になる人は登録しておける機能
- いいね機能で評価の高い記事がわかるようにする
- ユーザーの総いいね数、フォロワー数、記事投稿数を見て人気があるか指標にする
- 日々のつぶやきを見て情報収集の参考にする
- 下書きを保存しておける機能で書き途中でも大丈夫

## 実装した機能
- ログイン機能
- 記事・ツイート投稿機能（MD書式）
- ユーザーフォロー機能
- 記事お気に入り（しおり）機能
- いいね（Good）機能
- 画像をドラッグ＆ドロップで貼り付け機能
- タグ付け機能
- 記事検索機能(ransack)
- 記事下書き登録機能
- 

## 実装予定の機能
- 

## データベース設計(ER図)
- 

## ローカルでの動作方法
- Ruby ver.2.6.5
- Rails ver.6.0.3.4





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



