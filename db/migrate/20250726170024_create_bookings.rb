class CreateBookings < ActiveRecord::Migration[8.0]
  def change
    create_table :bookings do |t|
      t.references :member, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true
      t.date :booking_date
      t.time :start_time
      t.time :end_time
      t.integer :status

      t.timestamps
    end
  end
end
