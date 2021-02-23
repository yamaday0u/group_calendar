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
- has_many :user_calendars
- has_many :calendars, through: :user_calendars

## groups table

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| password | string | null: false |

### Association
- has_many :user_groups
- has_many :users, through: :user_groups
- has_many :group_calendars
- has_many :groups, through: :group_calendars

## calendars table

| Column     | Type     | Options     |
| ---------- | -------- | ----------- |
| title      | string   | null: false |
| content    | string   | null: false |
| start_time | datetime | null: false |
| end_time   | datetime | null: false |

### Association
- has_many :user_calendars
- has_many :users, through: :user_calendars
- has_many :group_calendars
- has_many :groups, through: :group_calendars

## chats table
| Column | Type   | Options     |
| text   | string | null: false |

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

## user_calendars table

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| calendar | references | null: false, foreign_key: true |

### Association
- belongs_to :user 
- belongs_to :calendar

## group_calendars table

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| group    | references | null: false, foreign_key: true |
| calendar | references | null: false, foreign_key: true |

### Association
- belongs_to :group
- belongs_to :calendar