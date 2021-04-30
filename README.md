# MENU

料理レシピの登録ができる。

* Ruby version  _6.0.0_

* テスト用アカウント 
  :test@test.com

* 利用方法
  :ユーザー新規登録してからレシピ登録をクリックして投稿する

* 目指した課題解決
  :料理する人が料理レシピを公開できる。



##  テーブル設計

## users

|Column             |Type    |Options                     |
|-------------------|--------|----------------------------|
|nickname           |string  |null: false                 |
|email              |string  |null: false,unique: true    |
|encrypted_password |string  |null: false                 |

### Association
has_many :menus

## menus

|Column             |Type        |Options                         |
|-------------------|------------|--------------------------------|
|menu_name          |string      |null: false                     |
|recipe             |text        |null: false                     |
|serving            |string      |null: false                     |
|user               |references  |null: false, foreign_key: true  |

### Association
belongs_to :user
has_many :menus, through: menu_food_stuffs
has_many :menu_food_stuffs


## food_stuffs
|Column             |Type        |Options                         |
|-------------------|------------|--------------------------------|
|food_stuff_name    |string      |null: false                     |
|quantity           |string      |null: false                     |
|menu               |references  |null: false, foreign_key: true  |

### Association
has_many :menu_food_stuffs
has_many :menus, through: menu_food_stuffs

## menu_food_stuffs
|Column             |Type        |Options                         |
|-------------------|------------|--------------------------------|
|quantity           |string      |null: false                     |
|food_stuff         |references  |null: false, foreign_key: true  |
|menu               |references  |null: false, foreign_key: true  |

### Association
belongs_to :food_stuff
belongs_to :menu
