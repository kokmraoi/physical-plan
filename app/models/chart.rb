class Chart < ApplicationRecord
  has_many :chart_users
  has_many :users, through: :chart_users
end
