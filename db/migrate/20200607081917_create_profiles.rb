class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string        :phonenumber
      t.integer       :old,                null:false
      t.integer       :job,                null:false
      t.integer       :experience,         null:false
      t.integer       :practice_time,      null:false
      t.text          :detail
      t.string        :club
      t.string        :avatar
      t.references    :user, foreign_key: true
      t.timestamps
    end
  end
end
