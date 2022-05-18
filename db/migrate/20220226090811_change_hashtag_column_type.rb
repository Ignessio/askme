class ChangeHashtagColumnType < ActiveRecord::Migration[6.1]
  def change
    change_column :hashtags, :body, :string
  end
end
