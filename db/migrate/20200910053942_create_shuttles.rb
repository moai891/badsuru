class CreateShuttles < ActiveRecord::Migration[6.0]
  def change
    create_table :shuttles do |t|
      t.string    :name, null:false
      t.string    :ancestry, index: :true
      t.timestamps
    end
  end
end
