## users テーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null :false, unique :true |
| encrypted_password | string | null :false               |
| nickname           | string | null :false               |
| lastname           | string | null :false               |
| firstname          | string | null :false               |
| lastname_kata      | string | null :false               |
| firstname_kata     | string | null :false               |
| birthday           | date   | null :false               |
| profile            | text   | null :false               |

### Association
- has_many :chart_users
- has_many :charts, through: :chart_users
- has_many :assessments
- has_many :diarys
- has_many :guidances

## charts テーブル
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null :false |

### Association
- has_many :chart_users
- has_many :users through: :chart_users
- has_many :assessments
- has_many :diarys
- has_many :guidances

## chart_users テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null :false, foreign_key: true |
| chart  | references | null :false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :chart

## assessments テーブル
| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| purpose                   | string     | null :false                    |
| weight                    | integer    | null :false                    |
| pain_id                   | integer    | null :false                    |
| desesthesia_id            | integer    | null :false                    |
| sensory_id                | integer    | null :false                    |
| strength_hip_flexion_id   | integer    | null :false                    |
| strength_hip_extension_id | integer    | null :false                    |
| strength_hip_abduction_id | integer    | null :false                    |
| strength_hip_adduction_id | integer    | null :false                    |
| strength_hip_external_id  | integer    | null :false                    |
| strength_hip_internal_id  | integer    | null :false                    |
| range_hip_flexion_id      | integer    | null :false                    |
| range_hip_extension_id    | integer    | null :false                    |
| range_hip_abduction_id    | integer    | null :false                    |
| range_hip_adduction_id    | integer    | null :false                    |
| range_hip_external_id     | integer    | null :false                    |
| range_hip_internal_id     | integer    | null :false                    |
| price                     | integer    | null :false                    |
| user                      | references | null :false, foreign_key: true |
| chart                     | references | null :false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :chart

## diarys テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| exercise | text       | null :false                    |
| user     | references | null :false, foreign_key: true |
| chart    | references | null :false, foreign_key: true |

### Association
- belongs_to :user
- delongs_to :chart

## guidances テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| message  | text       | null :false                    |
| user     | references | null :false, foreign_key: true |
| chart    | references | null :false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :chart

## tags テーブル
| Column   | Type       | Options     |
| -------- | ---------- | ----------- |
| name     | string     | null :false |

### Association
- has_many :tag_users
- has_many :user, through: :tag_users

## tag_users テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null :false, foreign_key: true |
| tag      | references | null :false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :tag

## requests テーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null :false, foreign_key: true |
| assessment | references | null :false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :assessment