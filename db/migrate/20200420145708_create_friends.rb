class CreateFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :friends do |t|
    	t.integer :user_id
    	t.integer :firend_id
    	t.timestamps
    end
  end
end
