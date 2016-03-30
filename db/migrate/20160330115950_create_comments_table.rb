class CreateCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :user, index: true
      t.string :comment_text, null: false
      t.integer :commentable_id, null: false, index: true
      t.string :commentable_type, null: false

      t.timestamps null: false
    end
  end
end

