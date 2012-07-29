class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.integer :parent_id
      t.string  :reference_code
      t.string  :name
      t.timestamps
    end
  end
end
