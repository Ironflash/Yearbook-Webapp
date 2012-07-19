class CommentsController < ApplicationController
  before_filter :signed_in_user

  def create
  	@comment = current_user.comments.build(params[:comment])
    if @comment.save
 		#if successful
 		render 'static_pages/home'
    else
      	#if unsuccessful
      	render 'static_pages/home'
    end
  end

  def destroy
  end
end