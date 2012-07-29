class CreateExpenditures < ActiveRecord::Migration
  def change
    create_table :expenditures do |t|
      t.integer  :year
      t.integer  :amount
      t.string   :budgetable_type
      t.integer  :budgetable_id
      t.integer  :user_id
      t.timestamps
    end
  end
end
