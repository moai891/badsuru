class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps 
    end
  end
end
