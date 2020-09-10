class Group < ApplicationRecord
  has_many        :members
  has_many        :users, through: :members
  has_many        :practices
  validates       :name, presence: true
  mount_uploader  :group_avatar, GroupAvatarUploader
end
