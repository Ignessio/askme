class CreateHashtags < ActiveRecord::Migration[6.1]
  def change
    create_table :hashtags do |t|
      t.text :body, null: false

      t.timestamps
    end
  end
end
