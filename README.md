# アプリケーション名
## ウマREN


# アプリケーション概要
## 馬が好きな同士がメッセージを通して交流できるアプリ


# URL
## https://umaren.onrender.com/


# テスト用アカウント
## ・メールアドレス: suzuka@ura.jp
## ・パスワード:umaren121


# 利用方法
## 交流したいユーザーを探す
### 1.トップページ(一覧ページ)のヘッダーからユーザー新規登録を行う

### 2.トップページ(一覧ページ)のヘッダーのユーザー検索をクリックし、その後交流したい相手の条件を入力、検索をすると条件に合ったユーザーが表示される

### 3.交流したいと思ったユーザーに対しいいねボタンを押し、その相手からもいいねボタンが押されると実際に会話をすることができる。

### 4.会話画面はトップページ(一覧ページ)のヘッダーのトークボタンを押すと対象のユーザーの会話画面が表示される 


# アプリケーションを作成した背景
### 同じ馬が好きな友人にヒアリングをし、「もっと馬のことで話せる友達が欲しい」という課題があがった、さらに深掘りをしてヒアリングをした結果、馬に絞った友達を作る場があまりないことが問題として判明し、「馬好き同士が交流できるプラットホームがないことが問題なのでは」と仮説を立てた。実際にホームページで検索したところ、馬に絞った交流サイトとして出ているものはなかった。この問題を解決するために、馬に特化した交流サイトを開発することにした。


# 洗い出した要件
## [要件を定義したシート](https://docs.google.com/spreadsheets/d/1L4lPZqUfL_vLcTrsLZ-L1PT7JLobcRvBaNrdXbjEseY/edit?usp=sharing){:target="_blank"}
























































# テーブル設計

## users テーブル

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| nickname           | string              | null: false,                   |
| email              | string              | null: false, unique: true      |
| encrypted_password | string              | null: false                    |
| gender_id          | integer             | null: false                    |
| birthday           | date                | null: false                    |
| prefecture_id      | integer             | null: false                    |
| favorite_genre     | string              | null: false                    |
| wish_meet_id       | string              | null: false                    |
| self-introduction  | text                |                                |

### Association

* has_many :talks
* has_many :reactions
* has_many :talk_room_users
* has_one :identifications



## talks テーブル

| Column             | Type               | Options                        |
|--------------------|--------------------|--------------------------------|
| message            | text               | null: false                    |
| user               | references         | null: false, foreign_key: true |
| talk_room          | references         | null: false, foreign_key: true |     

### Association

- belongs_to :user
- belongs_to :talk_room



## talk_rooms テーブル

| Column             | Type               | Options                        |
|--------------------|--------------------|--------------------------------|
|                    |                    |                                | 

### Association

* has_many :talks
* has_many :talk_room_users



## talk_room_users テーブル

| Column             | Type       | Options                                |
|--------------------|------------|----------------------------------------|
| user               | references | null: false, foreign_key: true         |
| talk_room          | references | null: false, foreign_key: true         |

### Association

- belongs_to :user
- belongs_to :talk_room



## reactions テーブル

| Column             | Type       | Options                                |
|--------------------|------------|----------------------------------------|
| to_user_id         | integer    | null: false                            |
| from_user_id       | integer    | null: false                            |
| status             | string     | null: false                            |
| user               | references | null: false, foreign_key: true         |


### Association

- belongs_to :user



## identifications テーブル

| Column             | Type       | Options                                |
|--------------------|------------|----------------------------------------|
| certification      | string     | null: false                            |
| user               | references | null: false, foreign_key: true         |

### Association

- belongs_to :user