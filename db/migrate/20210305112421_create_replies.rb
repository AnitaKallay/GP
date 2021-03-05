class CreateReplies < ActiveRecord::Migration[6.0]
  def change
    create_table :replies do |t|
      t.integer :user_id
      t.integer :comment_id
      t.integer :likes_count
      t.text :body
      t.timestamps
    end
  end
end
