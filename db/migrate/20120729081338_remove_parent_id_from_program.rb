class RemoveParentIdFromProgram < ActiveRecord::Migration
  def change
    remove_column :programs, :parent_id
  end
end
