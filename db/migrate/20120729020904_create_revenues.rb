class CreateRevenues < ActiveRecord::Migration
  def change
    create_table :revenues do |t|
      t.column :amount, :bigint
      t.column :year, :bigint

      t.timestamps
    end
  end
end
