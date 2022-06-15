class Chart < ApplicationRecord
  has_many :chart_users
  has_many :users, through: :chart_users

  validates :name, presence: true

end
