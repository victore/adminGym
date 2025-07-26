class CreateGyms < ActiveRecord::Migration[8.0]
  def change
    create_table :gyms do |t|
      t.string :name
      t.text :address
      t.string :phone
      t.string :email
      t.text :hours
      t.integer :status

      t.timestamps
    end
  end
end
