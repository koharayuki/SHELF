# README

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


# SHELFのER図

## usersテーブル

|  Column            |  Type      |  Options                       |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| password           | string     | null: false                    |
| encrypted_password | string     | null: false                    |
| favorite_genre_id  | integer    | null: false                    |


### Association

- has_many :follows
- has_many :articles
- has_many :favorites


## articlesテーブル

|  Column            |  Type      |  Options                       |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| text               | text       | null: false                    |
| genre_id           | integer    | null: false                    |
| URL                | text       | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- has_many :favorites
- has_many :categories
- belongs_to :user



## favoritesテーブル

|  Column            |  Type      |  Options                       |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| article            | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :article


## followsテーブル

|  Column            |  Type      |  Options                       |
| ------------------ | ---------- | ------------------------------ |
| follower           | references | null: false, foreign_key: true |
| following          | references | null: false, foreign_key: true |


### Association

- belongs_to :following, class_name: "User"
- belongs_to :follower, class_name: "User"


## categoriesテーブル

|  Column            |  Type      |  Options                       |
| ------------------ | ---------- | ------------------------------ |
| genre              | string     |                                |


### Association

- belongs_to :article

