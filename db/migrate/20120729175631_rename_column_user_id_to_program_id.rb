class RenameColumnUserIdToProgramId < ActiveRecord::Migration
  def change
    rename_column :expenditures, :user_id, :program_id
  end
end
