class FollowsController < ApplicationController

	def create
		current_user.friends.append(User.find(params[:friend_id]))
		redirect_to my_friends_path
	end


	def destroy
		association=Follow.where(follower_id: current_user, friend_id: params[:id])
		association.first.destroy

		flash.now[:notice]="Unfollow complete!"
		respond_to do |format|
			format.js { render :partial => "friends/list" }
			format.html {redirect_to user_path(params[:id])}
		end	
	end
end
