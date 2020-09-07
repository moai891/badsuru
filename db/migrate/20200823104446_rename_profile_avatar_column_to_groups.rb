class RenameProfileAvatarColumnToGroups < ActiveRecord::Migration[6.0]
  def change
    rename_column :groups, :profile_avatar, :group_avatar
  end
end
