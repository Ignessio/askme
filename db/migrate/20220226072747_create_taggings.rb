class CreateTaggings < ActiveRecord::Migration[6.1]
  def change
    create_table :taggings do |t|
      t.references :question, null: false, foreign_key: true
      t.references :hashtag, null: false, foreign_key: true

      t.timestamps
    end

    def change
      change_column_type :hashtags, :body, :string
    end
  end
end
