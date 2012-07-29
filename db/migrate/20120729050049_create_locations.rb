class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.timestamps
      t.integer  :parent_id
      t.string   :name
      t.column   :population, :bigint
    end
  end
end
