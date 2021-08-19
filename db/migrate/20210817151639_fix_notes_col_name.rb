class FixNotesColName < ActiveRecord::Migration[6.1]
  def change
    rename_column :notes, :add_deleted_at, :deleted_at

    rename_index :notes, 'index_notes_on_add_deleted_at', 'index_notes_on_deleted_at'
  end
end
