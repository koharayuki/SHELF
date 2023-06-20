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


<!--------- アプリのER図 ---------->


# SHELFのER図

## usersテーブル

|  Column            |  Type      |  Options                       |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| profile            | text       |                                |
| email              | string     | null: false, unique: true      |
| password           | string     | null: false                    |
| encrypted_password | string     | null: false                    |


### Association

- has_many :followings
- has_many :followers
- has_many :articles
- has_many :favorites


## articlesテーブル

|  Column            |  Type      |  Options                       |
| ------------------ | ---------- | ------------------------------ |
| title              | text       | null: false                    |
| text               | text       | null: false                    |
| genre_id           | integer    | null: false                    |
| URL                | text       |                                |
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
| follower           | references | null: false                    |
| following          | references | null: false                    |


### Association

- belongs_to :following, class_name: "User"
- belongs_to :follower, class_name: "User"



<!--------- アプリケーション概要 ---------->


# アプリケーション名

SHELF


# アプリケーション概要

記事やURLを投稿することで情報を保管する事ができる。またユーザー同士のフォロー機能を通して共有することもできる。


# URL

https://shelf-wxvx.onrender.com/

# テスト用アカウント

・Basic認証ID : admin
・Basic認証パスワード : 2222

<ユーザー①>
・メールアドレス : sample@com
・パスワード : sample1234
・ユーザー名 : sample

<ユーザー②>
・メールアドレス : test@com
・パスワード : test1234
・ユーザー名 : test


# ＜利用方法＞

## ・共通機能
1.ヘッダー部にある「SHELF」というロゴを押すとトップページへ遷移します。
※ページによってフッターにも表示があったり、ロゴマークのみの場合もありますが機能は同じです。


## ・記事投稿

1.トップページ(一覧ページ)のヘッダー部からユーザー新規登録を行う。
2.画面右下にある「投稿する」ボタンを押すと、新規投稿画面に遷移する。
3.入力欄へ必要な情報を入力し、画面下の「投稿する」ボタンを押すと投稿が完了します。
※「必須」と記載のある項目については入力しなければ投稿が完了しません。

## ・記事編集/削除機能

1.トップページ下部に全ユーザーの投稿が表示されます(投稿順での表示)。その記事を押すと、該当記事の詳細ページへ遷移します。
2.自身の投稿した記事のみ「記事の編集」と「記事の削除」ボタンが表示されます。「記事の編集」ボタンを押すと編集ページへと遷移し、「記事の削除」ボタンを押すと記事が削除されます。
3.入力欄へ編集したい情報を入力し、画面下の「変更する」ボタンを押すと記事の編集が完了します。「もどる」ボタンを押すと、編集せずに記事の詳細ページへ遷移します。


## ・お気に入り登録

1.トップページ下部に全ユーザーの投稿が表示されます(投稿順での表示)。その記事を押すと、該当記事の詳細ページへ遷移します。
2.記事詳細ページにある「お気に入り登録する」ボタンを押すと登録されます。
※お気に入り登録がされている場合は、ボタンの色が変わり「お気に入り解除する」という表示に変わります。
3.記事詳細ページにある「お気に入り解除する」ボタンを押すと登録が解除されます。
※お気に入り登録がされていない場合は、ボタンの色が変わり「お気に入り登録する」という表示に変わります。

## ・お気に入りリストの閲覧方法

1.トップページもしくは記事詳細ページで、ヘッダー部の「マイページ」もしくは「ユーザー名」を押すとマイページに遷移します。
※ログイン/ユーザー登録完了時点でヘッダー部にログインしている「ユーザー名」が表示されています。
2.ヘッダー部にある「お気に入り」を押すと、お気に入り一覧ページへ遷移します。
3.お気に入り登録が無い状態であれば”【お気に入り登録】してみましょう！”と表示がされます。
お気に入り登録がある状態であれば登録した記事が一覧表示されます。


## ・ユーザーフォロー機能

1.トップページ下部に全ユーザーの投稿が表示されます(一覧ページ)。その記事を押すと、該当記事の詳細ページへ遷移します。
2.＜投稿者＞という欄にあるユーザー名を押すと、投稿者のマイページに遷移します。
※投稿者欄にあるユーザー名の色が変わっています。
3.プロフィールの下にある「フォローする」ボタンを押すとフォローが完了します。
※「「フォローする」から「フォロー中」という表示に変わり、文字色が薄くなります。
4.下部にある「フォロワー」という項目にユーザー名と画像が表示されます。
※フォローした側のユーザーのマイページでは、「フォロー」という項目にユーザー名と画像が表示されます。
5.「フォローを解除する」ボタンを押すとフォロー解除が完了します。
※「フォローする」という表示に変わり、文字色が白色になります。
6.フォローもしくはフォロワーの欄にある「ユーザー名」もしくは「画像」を押すと、そのユーザーのマイページへ遷移します。

## ・マイページでの投稿一覧

1.上記「ユーザーフォロー機能」で示した各ユーザーのマイページ下部に、そのユーザーが投稿した記事一覧を表示しています。


# アプリケーションを作成した背景

情報社会と呼ばれる現代では、日常的にありとあらゆる情報に触れる機会が多いと感じています。本やニュース、人との対話など媒体は様々ですが、誰しもが今まで知り得た情報の中で”最適解”を導き出して「何をするか」選択しているものと考えています。それが画面越し(web上)での情報だった場合、「棚(SHELF)のような整理できる場所があれば」という想いから本アプリ制作に至りました。


# 洗い出した要件
https://docs.google.com/spreadsheets/d/1CzZkEfCGx31r3TFuwZ5gOjEe30svUiGCDLPe79nXAEw/edit#gid=982722306

# 実装した機能についてのGIFおよび説明・補足
・トップページ→マイページ:[![Image from Gyazo](https://i.gyazo.com/0721b4a5eef6d529c8880fd7101dbb09.gif)](https://gyazo.com/0721b4a5eef6d529c8880fd7101dbb09)

・マイページ→トップページ:[![Image from Gyazo](https://i.gyazo.com/d0fd0deecde7b406e9daa0e5d05dbc08.gif)](https://gyazo.com/d0fd0deecde7b406e9daa0e5d05dbc08)

・トップページ→記事詳細ページ:[![Image from Gyazo](https://i.gyazo.com/7e3173936daaea6e3b52b9f71baca565.gif)](https://gyazo.com/7e3173936daaea6e3b52b9f71baca565)

・記事詳細ページ→記事の編集ページ→トップページ:[![Image from Gyazo](https://i.gyazo.com/fd56423db6d619aaf1c91b920589f951.gif)](https://gyazo.com/fd56423db6d619aaf1c91b920589f951)

・記事をお気に入り登録した時の挙動:[![Image from Gyazo](https://i.gyazo.com/1c7b78394454e87c9f59282e3f7d5eb5.gif)](https://gyazo.com/1c7b78394454e87c9f59282e3f7d5eb5)

・マイページ→お気に入り一覧ページ:[![Image from Gyazo](https://i.gyazo.com/5db1b8dfffb38499eb8672c7f0effe45.gif)](https://gyazo.com/5db1b8dfffb38499eb8672c7f0effe45)

・ログインユーザーのマイページ→フォロワーのマイページ:[![Image from Gyazo](https://i.gyazo.com/f5e3b7866efd727700ceb83e2301815c.gif)](https://gyazo.com/f5e3b7866efd727700ceb83e2301815c)

・ユーザーをフォローした時の挙動:[![Image from Gyazo](https://i.gyazo.com/67c36408b317122e62a73196db627f88.gif)](https://gyazo.com/67c36408b317122e62a73196db627f88)


# 実装予定の機能
実装予定の機能は以下の通りです。

・検索機能（意図した記事を表示させるなどラベリングを目的とした機能）

・並べ替え/絞り込み機能（ジャンル別の表示もしくはタグ付機能など）

・ユーザー編集/削除機能(ユーザー画像を変えたり、プロフィールを充実させたいユーザー向けの機能)

・マイページでのフォロー/フォロワー/投稿一覧表示を押すと一覧表示がなされる仕様に変更
（それぞれ登録数が増えるとマイページが見にくくなると想定するため）


# データベース設計

[![Image from Gyazo](https://i.gyazo.com/eae283b3762875f0a8d2a4b3f9019b84.png)](https://gyazo.com/eae283b3762875f0a8d2a4b3f9019b84)


# 画面遷移図

[![Image from Gyazo](https://i.gyazo.com/aa4c01472a50fb9ccdbe3725c921fe93.png)](https://gyazo.com/aa4c01472a50fb9ccdbe3725c921fe93)


# 開発環境

・フロントエンド
・バックエンド
・インフラ
・テスト
・テキストエディタ
・タスク管理

# ローカルでの動作方法

以下のコマンドを順に実行。

% git clone https://github.com/koharayuki/SHELF

% cd SHELF

% bundle install

% yarn install

# 工夫したポイント

本アプリ制作を進める上で”開発者でありながら１番目のユーザーである"という考え方を大事にしてきました。ページ遷移などの動線、表示の仕方しだいでユーザーから認識しやすい仕様などについて工夫してきました。本アプリのコンセプトとした”情報を収納できる棚のようなモノ”という要件は達成出来ていると考えますが。実際に家族や友人たちからブラッシュアップを貰って、よりユーザー目線での開発が出来るよう精進していきたいと思います。