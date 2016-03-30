class CreateQuestionsTable < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question_text, null: false
      t.belongs_to :user, index: true, null: false
      t.integer :view_count, default: 0

      t.timestamps null: false
    end
  end
end
