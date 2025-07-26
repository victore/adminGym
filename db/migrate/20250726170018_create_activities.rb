class CreateActivities < ActiveRecord::Migration[8.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.integer :duration
      t.integer :capacity
      t.decimal :price
      t.string :category
      t.integer :status
      t.references :gym, null: false, foreign_key: true

      t.timestamps
    end
  end
end
