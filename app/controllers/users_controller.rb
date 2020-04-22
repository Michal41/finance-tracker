class UsersController < ApplicationController


	def my_portfolio
			#@tracked_stocks = current_user.stocks 
	end

	def my_friends
		#redirect_to root_path
	end

	def search
		puts params[:friend_email]
		@friend=User.where(email: params[:friend_email]).first
		if @friend
			render_js
		else
			flash.now[:alert]='wrong email addres'
			render_js
		end
	end

	private
	def render_js
		respond_to do |format|
			format.js { render :partial => "follows/result" }
		end
	end

end
