class CreateMembershipPlans < ActiveRecord::Migration[8.0]
  def change
    create_table :membership_plans do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :duration_months
      t.text :features
      t.integer :status

      t.timestamps
    end
  end
end
