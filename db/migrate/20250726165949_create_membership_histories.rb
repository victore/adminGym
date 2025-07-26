class CreateMembershipHistories < ActiveRecord::Migration[8.0]
  def change
    create_table :membership_histories do |t|
      t.references :member, null: false, foreign_key: true
      t.references :membership_plan, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.integer :status
      t.decimal :payment_amount

      t.timestamps
    end
  end
end
