class CreateAnswersTable < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :answer_text, null: false
      t.belongs_to :user, index: true, null: false
      t.belongs_to :question, index: true, null: false

      t.timestamps null: false
<<<<<<< HEAD
=======
    end
>>>>>>> master
  end
end
