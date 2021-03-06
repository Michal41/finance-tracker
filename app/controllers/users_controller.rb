class UsersController < ApplicationController
	before_action :require_login

	def my_portfolio

	end

	def my_friends
		
	end

	def show
		@user=User.find(params[:id])
	end


	def search
		User.all.each do |user|
			puts user.id
		end
		if params[:friend_email].blank?
			flash.now[:alert]='Please enter email addres or name'
			render_js
			return false
		end
		@friends=User.search(params[:friend_email])
		if @friends
			@friends=current_user.except_current_user(@friends)
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

	private
	def require_login
	 if !user_signed_in?
	 	redirect_to root_path
	 end
	end

end
