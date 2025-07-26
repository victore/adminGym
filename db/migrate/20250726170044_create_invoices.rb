class CreateInvoices < ActiveRecord::Migration[8.0]
  def change
    create_table :invoices do |t|
      t.references :member, null: false, foreign_key: true
      t.decimal :total_amount
      t.date :due_date
      t.integer :status
      t.string :invoice_number

      t.timestamps
    end
    add_index :invoices, :invoice_number, unique: true
  end
end
