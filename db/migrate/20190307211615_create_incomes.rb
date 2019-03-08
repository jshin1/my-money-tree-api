class CreateIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :incomes do |t|
      t.string :name
      t.integer :amount
      t.integer :user_id

      t.timestamps
    end
  end
end
