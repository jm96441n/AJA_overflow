class CreateTagsquestionsTable < ActiveRecord::Migration
  def change
    create_table :tag_questions do |t|
      t.belongs_to :question, null: false, index: true
      t.belongs_to :tag, null: false, index: true
      t.timestamps null: false
  end
end
