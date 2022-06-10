# アプリケーション名
Physical Plan

# アプリケーション概要
自己目標をクリアしていくため、アプリケーションにより今の健康状態をアセスメントし、目標達成のためのエクササイズが提案される。  アドバイザーから、よりカスタマイズされたアドバイスを受けることもできる。

# URL
https://physical-plan.herokuapp.com/

# テスト用アカウント
・Basic認証ID : admin  
・Basic認証パスワード : 2468  
・メールアドレス : test1@com  
・パスワード : 123abc

# 利用方法
## ユーザー登録
クライアントとアドバイザーの双方がアカウントを作ることができる。

## カルテ作成機能
他のクライアントからは見えないよう、パーソナルカルテを作ることができる。

## アセスメントとサマリーの機能
初回および初回以降の身体機能(股関節周囲)のアセスメントとその結果を踏まえたサマリーが表示され、必要な運動が提示される。

## ダイアリー機能
初回以降のエクササイズ記録を蓄積し、振り返ることができる。

# アプリケーションを作成した背景
リハビリテーションで関わってきた患者様を振り返り、もっと早く症状に気付いて対処していたらもっと豊かな生活を送れていたのではないかという気付きから発案した。
アプリケーションを開発するにあたり、身体機能をただ測定するだけではなく、目標のもとにアセスメントを行う事でより必要な身体機能にアプローチすることができるのではないかと考えた。

# 実装予定の機能
現在、ダイアリー管理機能を実装中。  
よりカスタマイズされた指導を受けられるガイダンス機能、自分の症状にあったアドバイザーを選択できるタグ機能、利益を得るためのリクエスト機能を実装予定。

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/d61adba8a3f3792d60c43285a0637ad8.png)](https://gyazo.com/d61adba8a3f3792d60c43285a0637ad8)
[![Image from Gyazo](https://i.gyazo.com/c47299434bae4c07cb4ce66446cc9c87.png)](https://gyazo.com/c47299434bae4c07cb4ce66446cc9c87)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/4661efa71689fe85b801281617cbf06c.png)](https://gyazo.com/4661efa71689fe85b801281617cbf06c)

# 開発環境
・フロントエンド : BootStrap  
・バックエンド : Ruby, Ruby on Rails  
・テキストエディタ : Visual Studio Code  
・タスク管理 : GitHub

# 工夫した点
・ユーザーが使いやすいシンプルなフロントデザイン。  
・1つの画面に情報が集約されている。  
・保守や追加を行いやすいよう、コードをシンプルにする。

# テーブル設計
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
- has_many :diaries
- has_many :guidances

## charts テーブル
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null :false |

### Association
- has_many :chart_users
- has_many :users through: :chart_users
- has_many :assessments
- has_many :diaries
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
| dysesthesia_id            | integer    | null :false                    |
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

## diaries テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| exercise | text       | null :false                    |
| user     | references | null :false, foreign_key: true |
| chart    | references | null :false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :chart

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