class StocksController < ApplicationController
	

	def search
		if params[:stock].present?
			@stock=Stock.new_lookup(params[:stock])
			if @stock
				render_js	
			else
				flash.now[:alert]='Plese enter a valid symbol'
				render_js
			end
		else
			flash.now[:alert]= 'Please enter a symbol to search'
			render_js
		end
	end

	private
	def render_js
		respond_to do |format|
			format.js { render :partial => "users/result" }
		end
	end

end
