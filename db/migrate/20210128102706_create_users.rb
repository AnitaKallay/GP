class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :role
      t.string :avatar
      t.string :IMC
      t.string :password_digest
      t.string :gp_type
      t.string :practice_name
      t.string :country
      t.string :county
      t.timestamps
    end
  end
end
