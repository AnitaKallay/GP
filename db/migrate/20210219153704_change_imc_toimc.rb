class ChangeImcToimc < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :IMC, :imc
  end
end
