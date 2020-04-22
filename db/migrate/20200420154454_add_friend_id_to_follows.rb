class AddFriendIdToFollows < ActiveRecord::Migration[6.0]
  def change
  	add_column :follows, :friend_id, :integer
  end
end
