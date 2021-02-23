class CreateConsultations < ActiveRecord::Migration[6.0]
  def change
    create_table :consultations do |t|
      t.string :disclaimer
      t.string :title
      t.string :history
      t.string :exam
      t.string :impression
      t.string :plan
      t.string :additional_info
      t.string :broshure
      t.integer :user_id
      t.timestamps
    end
  end
end
