class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one  :profile
  has_many :groups, through: :members, dependent: :destroy
  has_many :practices, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :joinings, dependent: :destroy
  validates :nickname, presence: true
end
