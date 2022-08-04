class RenameOldTableToNewTable < ActiveRecord::Migration[7.0]
  def change
    rename_table :transactions, :payments
  end
end
