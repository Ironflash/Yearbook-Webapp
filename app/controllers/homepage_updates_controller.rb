class HomepageUpdatesController < ApplicationController
	before_filter :admin_user

	def create
		@update = HomepageUpdate.new(params[:homepage_update])
	  	if @update.save
	  		redirect_to root_path
	  	else
	  		redirect_to admin_path
	  	end 
	end

	def destroy

	end

	private
		def admin_user
	      redirect_to(root_path) unless current_user.admin?
	    end
end