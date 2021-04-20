# Application
Group Calendar

# Outline
You can manage your schedules & communicate with
- your family
- your friends
- your project team
in this app.

# Entity Relationship Diagram(ERD)
[![Image from Gyazo](https://i.gyazo.com/1418453bfd6165bf6edffe9b9dd59b0a.png)](https://gyazo.com/1418453bfd6165bf6edffe9b9dd59b0a)


# Table Design

## users table

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| identity | string |             |

### Association
- has_many :user_groups
- has_many :groups, through: :user_groups
- has_many :calendars
- has_many :chats

## groups table

| Column  | Type   | Options     |
| ------- | ------ | ----------- |
| name    | string | null: false |
| outline | string |  |
| task    | string |             |

### Association
- has_many :user_groups
- has_many :users, through: :user_groups
- has_many :group_calendars
- has_many :chats

## calendars table

| Column     | Type       | Options                       |
| ---------- | ---------- | ----------------------------- |
| title      | string     | null: false                   |
| content    | string     | null: false                   |
| start_time | datetime   | null: false                   |
| end_time   | datetime   | null: false                   |
| user       | references | null: false, foreign_key true |

### Association
- belongs_to :user

## group calendars table

| Column     | Type       | Options                       |
| ---------- | ---------- | ----------------------------- |
| title      | string     | null: false                   |
| content    | string     | null: false                   |
| start_time | datetime   | null: false                   |
| end_time   | datetime   | null: false                   |
| user       | references | null: false, foreign_key true |
| group      | references | null: false, foreign_key true |

### Association
- belongs_to :user
- belongs_to :group

## chats table
| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| text   | string     | null: false                   |
| user   | references | null: false, foreign_key true |
| group  | references | null: false, foreign_key true |

- belongs_to :user
- belongs_to :group

## Intermediate Tables

## user_groups table

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| group  | references | null: false, foreign_key: true |

### Association
- belongs_to :user 
- belongs_to :group 