require 'test_helper'

class AddStockToPortfolioTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

	setup do
		get '/users/sign_in'
		sign_in users(:user_001)
		post user_session_url
	end



  test "Add stock to portfolio" do
  	get my_portfolio_path
  	assert_template 'users/my_portfolio'


  	assert_difference 'UserStock.count', 1 do
  	get search_stock_path, xhr: true , params:{stock: "GOOG"}
  	assert_match "GOOG", response.body
  	post user_stocks_path
  	follow_redirect!
  	end
  	assert_template 'users/my_portfolio'
	end
end
