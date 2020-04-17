class UserStocksController < ApplicationController

	def create
		stock = Stock.check_db(params[:ticker])
		if stock.blank?
			stock = Stock.new_lookup(params[:ticker])
			stock.save
		end
		@user_stock=UserStock.create(user:current_user, stock:stock)
		flash[:notice]="Stock #{stock.name} was successfully added"
		redirect_to my_portfolio_path
	end


	def destroy
		UserStock.destroy_by(user_id: current_user.id, stock_id: params[:id])
		flash.now[:notice]="#{Stock.find(params[:id]).name} 
				was successfully removed from your portfolio"
		respond_to do |format|
			format.js { render :partial => "stocks/list" }
		end
	end


end
