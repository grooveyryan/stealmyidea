class RenameContentToThoughts < ActiveRecord::Migration[5.1]
  def change
    rename_column :comments, :content, :thoughts
  end
end
