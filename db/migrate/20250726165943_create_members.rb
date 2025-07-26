class CreateMembers < ActiveRecord::Migration[8.0]
  def change
    create_table :members do |t|
      t.references :user, null: false, foreign_key: true
      t.references :membership_plan, null: false, foreign_key: true
      t.references :gym, null: false, foreign_key: true
      t.string :membership_number
      t.date :join_date
      t.date :expiry_date
      t.integer :status
      t.string :emergency_contact
      t.string :emergency_phone

      t.timestamps
    end
    add_index :members, :membership_number, unique: true
  end
end
