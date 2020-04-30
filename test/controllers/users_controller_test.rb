require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

	include Devise::Test::IntegrationHelpers

	setup do
		get '/users/sign_in'
		sign_in users(:user_001)
		post user_session_url
	end

  test "should get my portfolio path" do
  	@user=User.new(email:'michal.kanarek@gmail.com',password:'password')
  	get my_portfolio_path
  	assert_response :success   	
	end
	test "should get my friends path" do
  	@user=User.new(email:'michal.kanarek@gmail.com',password:'password')
  	get my_friends_path
  	assert_response :success   	
	end
end
