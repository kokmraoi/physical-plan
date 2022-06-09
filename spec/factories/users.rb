FactoryBot.define do
  factory :user do
    email                 { 'test@example' }
    password              { '123abc' }
    password_confirmation { password }
    nickname              { 'テスト' }
    lastname              { 'あべ' }
    firstname             { 'たろう' }
    lastname_kata         { 'アベ' }
    firstname_kata        { 'タロウ' }
    birthday              { '2000-12-31' }
    profile               { 'これは自己紹介文' }
  end
end
