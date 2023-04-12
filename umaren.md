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