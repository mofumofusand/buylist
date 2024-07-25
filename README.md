# アプリケーション名
buylist

# アプリケーション概要
  買い物リストを作成することで買い忘れを防ぐ

# URL

# テスト用アカウント

# 利用方法

# アプリケーションを作成した背景
  普段の買い物で結構買い忘れをすることがあるので、</br>
  カテゴリー別(tag機能)で画面がシンプルで見やすいアプリがあればと思い開発することにしました。

# 要件定義
## 新規登録機能
    ニックネームは必須
    メールアドレスは必須
    メールアドレスは一意性がある
    メールアドレスは@を含まないといけない
    パスワードは8文字以上必須

## 一覧表示機能
    ヘッダーに新規登録ページとログインページに遷移するリンクがある
    ログイン時にはヘッダーにログアウトするリンクがある
    買い物リストをカテゴリー別で一覧表示できる
    編集ページに遷移するリンクがある
    追加用ページに遷移するリンクがある 
    詳細ページに遷移するリンクがある

## 追加機能
    フォームから投稿内容を入力できて、投稿ボタンから投稿できる
    tag機能でカテゴリーを選べる
    ヘッダーにトップページのリンクがある

## 編集機能
    詳細画面から投稿内容横の編集ボタンを押すと編集フォームが表示される
    何も変更せずに編集した場合も投稿内容は消えない
    カテゴリーと投稿内容を編集できる
    ヘッダーにトップページのリンクがある

## 詳細機能
    選択したカテゴリーの一覧内の投稿内容を表示する
    投稿内容横に編集ボタンと削除ボタンを表示させる
    ヘッダーにトップページのリンクがある

## 削除機能
    詳細ページから削除ボタンを押すと投稿内容が削除される
    削除完了後は一覧ページに遷移する

# 実装した機能についての画像やGIF及びその説明
# 実装予定の機能
    一覧表示画面の投稿内容横にチェックボックスを作成し、チェックが入れば内容に横線が入るように実装予定です
# データベース設計
[![Image from Gyazo](https://i.gyazo.com/8ad6316736ccbc97a8dd38d738d0c993.png)](https://gyazo.com/8ad6316736ccbc97a8dd38d738d0c993)
# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/f9eaed48cf9fdef5bb0bd5a9c3218b8c.png)](https://gyazo.com/f9eaed48cf9fdef5bb0bd5a9c3218b8c)
# 開発環境
# ローカルでの動作方法
# 工夫したポイント
# 改善点
# 制作時間


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