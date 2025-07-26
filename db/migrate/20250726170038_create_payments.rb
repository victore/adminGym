class CreatePayments < ActiveRecord::Migration[8.0]
  def change
    create_table :payments do |t|
      t.references :member, null: false, foreign_key: true
      t.decimal :amount
      t.string :payment_method
      t.date :payment_date
      t.integer :status
      t.string :reference_number

      t.timestamps
    end
  end
end
