class Practice < ApplicationRecord
  has_many :practice_members
  has_many :users, through: :practice_members, dependent: :destroy
  has_many :participants, dependent: :destroy
  # belongs_to :group
  belongs_to :shuttle
  validates :name, :shuttle_id, :manager_id, presence: :true
end
