class AddLocationReferenceToRevenue < ActiveRecord::Migration
  def change
    add_column :revenues, :location_id, :bigint
  end
end
