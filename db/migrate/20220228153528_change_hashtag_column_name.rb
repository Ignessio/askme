class ChangeHashtagColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :hashtags, :body, :name
  end
end
