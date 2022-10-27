class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.string :name, null: false, default: ""
      t.integer :amount_cents, null: false, default: 0

      t.timestamps
    end
  end
end
