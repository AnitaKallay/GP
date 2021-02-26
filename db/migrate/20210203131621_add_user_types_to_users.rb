class AddUserTypesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_types, :string
  end
end
