# アプリケーション名
buylist

# アプリケーション概要
  買い物リストを作成することで買い忘れを防ぐ

# URL
https://buylist-5wwp.onrender.com/
# テスト用アカウント

# 利用方法
## リスト投稿
 1.ユーザーの新規登録を行う</br>
 2.追加ページボタンから、内容(購入物・数量・カテゴリ)を入力して追加する

# アプリケーションを作成した背景
  普段の買い物で結構買い忘れをすることがあるので、</br>
  カテゴリー別(tag機能)で画面がシンプルで見やすいアプリがあればと思い開発することにしました。

# 要件定義
## 新規登録機能
    ニックネームは必須
    メールアドレスは必須
    メールアドレスは一意性がある
    メールアドレスは@を含まないといけない
    パスワードは6文字以上必須

## 一覧表示機能
    ヘッダーに新規登録ページとログインページに遷移するリンクがある
    ログイン時にはヘッダーにログアウトするリンクがある
    買い物リストをカテゴリー別で一覧表示できる
    編集ページに遷移するリンクがある
    追加用ページに遷移するリンクがある 

## 追加機能
    フォームから投稿内容を入力できて、投稿ボタンから投稿できる
    tag機能でカテゴリーを選べる
    ヘッダーにトップページのリンクがある

## 編集機能
    詳細画面から投稿内容横の編集ボタンを押すと編集フォームが表示される
    何も変更せずに編集した場合も投稿内容は消えない
    カテゴリーと投稿内容を編集できる
    ヘッダーにトップページのリンクがある

## 削除機能
    詳細ページから削除ボタンを押すと投稿内容が削除される
    削除完了後は一覧ページに遷移する

## 検索機能
    検索ページから絞り込み機能ができる

# 実装した機能についての画像やGIF及びその説明
 1.トップページ
[![Image from Gyazo](https://i.gyazo.com/efa3897122bfcf7e33e5bed00982a9dc.png)](https://gyazo.com/efa3897122bfcf7e33e5bed00982a9dc)

2.検索機能
https://i.gyazo.com/cfd021d3d0a95653c22818108df30360.mp4

3.追加機能
https://i.gyazo.com/c29cbad85b79d6e0eb4a4a843a5ea473.mp4

# 実装予定の機能
    チェックを複数つけている際にページが遷移するとチェックが消えてしまうのでチェックしていた項目は残るようにしたい
# データベース設計
[![Image from Gyazo](https://i.gyazo.com/8ad6316736ccbc97a8dd38d738d0c993.png)](https://gyazo.com/8ad6316736ccbc97a8dd38d738d0c993)
# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/56034ab00d151821e1bdd0cdad27e7e5.png)](https://gyazo.com/56034ab00d151821e1bdd0cdad27e7e5)
# 開発環境
# ローカルでの動作方法
# 工夫したポイント
# 改善点
ログインユーザー別で一覧表示する内容を変更したい
# 制作時間
  2週間

# テーブル設計

## users

| Column             | Type    | Options                  |
|--------------------|---------|--------------------------|
| nickname           | string  | null: false              |
| email              | string  | null: false, unique:true |
| encrypted_password | string  | null: false              |

### Association

- has_many :lists
- has_many :categories


## lists

| Column   | Type       | Options                        |
|----------|------------|--------------------------------|
| content  | string     | null: false                    |
| quantity | string     |                                |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :category_lists
- has_many :categories, through: :category_lists


## categories

| Column   | Type       | Options                        |
|----------|------------|--------------------------------|
| tag_name | string     | null: false                    |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :category_lists
- has_many :lists, through: :category_lists


## category_lists

| Column   | Type       | Options                        |
|----------|------------|--------------------------------|
| category | references | null: false, foreign_key: true |
| list     | references | null: false, foreign_key: true |

### Association

- belongs_to :category
- belongs_to :list