class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
    validates :nickname
    validates :firstname
    validates :lastname
  end
  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/ } do
    validates :firstname_kata
    validates :lastname_kata
  end
  validates :birthday, presence: true
  validates :profile, presence: true

  has_many :chart_users
  has_many :charts, through: :chart_users
end
