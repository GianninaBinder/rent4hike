class RenameColumnTypeToCategory < ActiveRecord::Migration[6.1]
  def change
    rename_column :tools, :type, :category
  end
end
