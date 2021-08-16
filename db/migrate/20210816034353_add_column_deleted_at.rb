class AddColumnDeletedAt < ActiveRecord::Migration[6.1]
  def change
    add_column :notes, :add_deleted_at, :datetime
    add_index :notes, :add_deleted_at

  end
end
