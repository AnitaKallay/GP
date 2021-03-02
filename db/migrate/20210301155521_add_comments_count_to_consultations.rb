class AddCommentsCountToConsultations < ActiveRecord::Migration[6.0]
  def change
    add_column :consultations, :comments_count, :integer
  end
end
