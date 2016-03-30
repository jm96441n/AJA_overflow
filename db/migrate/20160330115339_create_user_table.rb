class CreateUserTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, uniqueness: true, null: false, index: true
      t.string :email, uniqueness: true, null: false, index: true
      t.string :password_digest, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :company_name
      t.string :role
      t.string :recovery_mom_maiden_name, null: false
      t.string :recovery_first_street, null: false
      t.string :recovery_first_pet, null: false

      t.timestamps null: false
    end
  end
end
