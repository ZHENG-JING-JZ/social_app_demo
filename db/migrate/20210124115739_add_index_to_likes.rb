class AddIndexToLikes < ActiveRecord::Migration[6.1]
  def change
    add_index :likes, :user_id
    add_index :likes, :post_id
  end
end
