class Group < ApplicationRecord
  has_many :members
  has_many :users, through: :members
  validates :name, presence: true
  mount_uploader :group_avatar, GroupAvatarUploader
end
