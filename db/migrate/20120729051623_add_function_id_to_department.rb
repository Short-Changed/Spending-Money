class AddFunctionIdToDepartment < ActiveRecord::Migration
  def change
    add_column :departments, :function_id, :integer
    add_index :departments, :function_id
  end
end
