class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :groups, through: :members, dependent: :destroy
  has_many :practices, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :joinings, dependent: :destroy
  validates :nickname, :old, :job_id, :experience, :practice_time, presence: true
  validates :phonenumber, null: false
end
