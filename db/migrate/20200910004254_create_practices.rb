class CreatePractices < ActiveRecord::Migration[6.0]
  def change
    create_table :practices do |t|
      t.string      :name, null:false
      t.string      :group_name
      t.date        :date
      t.time        :start_time
      t.time        :end_time
      t.integer     :prefecture_code
      t.string      :city
      t.string      :place
      t.text        :detail
      t.integer     :visitor_pay
      t.references  :shuttle, foreign_key: true, null: false
      t.references  :manager, foreign_key: { to_table: :users }, null: false
      t.integer     :member_limit
      t.timestamps
    end
  end
end
