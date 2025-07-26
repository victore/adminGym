class CreateEquipment < ActiveRecord::Migration[8.0]
  def change
    create_table :equipment do |t|
      t.string :name
      t.text :description
      t.string :category
      t.string :serial_number
      t.date :purchase_date
      t.date :maintenance_date
      t.integer :status
      t.references :gym, null: false, foreign_key: true

      t.timestamps
    end
  end
end
