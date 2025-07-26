class CreateStaffSchedules < ActiveRecord::Migration[8.0]
  def change
    create_table :staff_schedules do |t|
      t.references :staff, null: false, foreign_key: true
      t.references :gym, null: false, foreign_key: true
      t.integer :day_of_week
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
