require 'test_helper'

class FollowFriendTest < ActionDispatch::IntegrationTest
  
  include Devise::Test::IntegrationHelpers

	setup do
		get '/users/sign_in'
		sign_in users(:user_001)
		post user_session_url
	end

	test "Follow friend" do
		get my_friends_path
		assert_template 'users/my_friends'

		assert_difference 'Follow.count',1 do
			get search_friend_path, xhr: true , params:{friend_email: "test2"}
			assert_match "test2@test.com", response.body
			post follows_path, params:{friend_id:3}
			follow_redirect!
		end
		assert_template 'users/my_friends'
		assert_match "test2@test.com", response.body
		assert true 
	end

end
