class CreatePracticeMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :practice_members do |t|
      t.references :user, foreign_key: true
      t.references :practice, foreign_key: true
      t.timestamps
    end
  end
end
