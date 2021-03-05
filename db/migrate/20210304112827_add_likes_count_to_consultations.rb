class AddLikesCountToConsultations < ActiveRecord::Migration[6.0]
  def change
    add_column :consultations, :likes_count, :integer
  end
end
