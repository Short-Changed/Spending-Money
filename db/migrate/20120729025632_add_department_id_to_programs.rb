class AddDepartmentIdToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :department_id, :integer
  end
end
