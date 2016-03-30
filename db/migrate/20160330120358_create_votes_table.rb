class CreateVotesTable < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :votable_id, null: false
      t.string :votable_type, null: false
      t.belongs_to :user, null:false

      t.timestamps null: false
    end
  end
end
