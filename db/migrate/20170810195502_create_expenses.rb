class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      t.string :expense_type
      t.date :date
      t.string :concept
      t.references :category, foreign_key: true
      t.decimal :amount

      t.timestamps
    end
  end
end
