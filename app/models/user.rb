class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
    validates :nickname
    validates :firstname
    validates :lastname
  end
  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/ } do
    validates :firstname_kata
    validates :lastname_kata
  end
  validates :profile, presence: true
end
