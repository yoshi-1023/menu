# MENU

レシピの登録ができるランダムで献立を決めることができる。

* Ruby version  _6.0.0_



#  テーブル設計

## users

|Column             |Type    |Options                     |
|-------------------|--------|----------------------------|
|nickname           |string  |null: false                 |
|email              |string  |null: false,unique: true    |
|encrypted_password |string  |null: false                 |

### Association
has_many :items

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
|serving            |string      |null: false                     |
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
