class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :text, null: false
      t.string :answer

      t.timestamps null: false
    end
  end
end
