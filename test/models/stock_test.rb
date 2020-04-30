require 'test_helper'

class StockTest < ActiveSupport::TestCase
	
	def setup
		@stock=Stock.new_lookup('GOOG')
		@stock2=Stock.new(ticker:"D",name:'name')
	end

	test "stock should be valid" do
	 	assert @stock.valid?
	end

	test 'stock ticker should be present' do
		@stock.ticker=''
		assert_not @stock.valid?
	end

	test 'stock name should be present' do
		@stock.name=''
		assert_not @stock.valid?
	end

	test 'stock update prace' do 
		@stock2.update_price
		assert_not @stock2.last_price.nil?
	end

end
