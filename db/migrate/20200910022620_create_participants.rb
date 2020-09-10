class CreateParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :participants do |t|
      t.integer :status_code
      t.string :comment
      t.references :user, foreign_key: true, null:false
      t.references :practice, foreign_key: true, null:false
      t.timestamps
    end
  end
end
