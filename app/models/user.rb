class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # :validatableは使用しないため削除
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one   :profile
  has_many  :members
  has_many  :practice_members
  has_many  :groups, through: :members, dependent: :destroy
  has_many  :practices, through: :practice_members, dependent: :destroy
  has_many  :messages, dependent: :destroy
  has_many  :participants, dependent: :destroy
  validates :nickname, presence: true
end