class AddColumnReferenceCodeToFunctions < ActiveRecord::Migration
  def change
    add_column :functions, :reference_code, :string
    add_index :functions, :reference_code
  end
end
