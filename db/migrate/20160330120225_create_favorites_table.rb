class CreateFavoritesTable < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.belongs_to :user, index: true
      t.integer :favoritable_id, null: false, index: true
      t.string :favoritable_type, null: false, index: true

      t.timestamps null: false
    end
  end
end
