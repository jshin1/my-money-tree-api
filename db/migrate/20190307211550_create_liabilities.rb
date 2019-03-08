class CreateLiabilities < ActiveRecord::Migration[5.2]
  def change
    create_table :liabilities do |t|
      t.string :name
      t.integer :amount
      t.integer :user_id

      t.timestamps
    end
  end
end
