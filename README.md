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
![ログイン](https://user-images.githubusercontent.com/71271771/107730706-6c262480-6d37-11eb-97d0-70ca9d9b96bc.gif)
- 記事・ツイート投稿機能（MD書式）
![記事投稿](https://user-images.githubusercontent.com/71271771/107730783-9a0b6900-6d37-11eb-926c-39f820fbf811.gif)

- ユーザーフォロー機能

- 記事お気に入り（しおり）機能
![いいね、お気に入り追加機能](https://user-images.githubusercontent.com/71271771/107730795-a8f21b80-6d37-11eb-80fd-dc59e51e6421.gif)

![しおり一覧表示](https://user-images.githubusercontent.com/71271771/107730818-bd361880-6d37-11eb-8ce2-7ed120ad7ab8.gif)
- いいね（Good）機能
![いいね、お気に入り追加機能](https://user-images.githubusercontent.com/71271771/107730804-b1e2ed00-6d37-11eb-81e6-a90762d34c6a.gif)
- 画像をドラッグ＆ドロップで貼り付け機能
![画像挿入](https://user-images.githubusercontent.com/71271771/107730854-d63ec980-6d37-11eb-8d92-1bb0d8717e84.gif)
- 記事検索機能(ransack)
![記事検索機能](https://user-images.githubusercontent.com/71271771/107730893-eb1b5d00-6d37-11eb-85be-3dc374961289.gif)


- タグ付け機能

- 記事下書き登録機能


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



