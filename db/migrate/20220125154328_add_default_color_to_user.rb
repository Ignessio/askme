class AddDefaultColorToUser < ActiveRecord::Migration[6.1]
  def self.up
    change_column :users, :color, :string, :default => "#005a55"
  end
end
