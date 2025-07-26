class CreateStaffs < ActiveRecord::Migration[8.0]
  def change
    create_table :staffs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :gym, null: false, foreign_key: true
      t.string :position
      t.date :hire_date
      t.decimal :salary
      t.integer :status

      t.timestamps
    end
  end
end
