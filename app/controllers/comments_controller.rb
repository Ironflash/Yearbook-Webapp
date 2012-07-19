class CommentsController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user,   only: :destroy

  def create
  	@comment = current_user.comments.build(params[:comment])
    if @comment.save
 		#if successful
 		# render 'update' 
 		render story_path(Story.find(@comment.story_id))
    else
      	#if unsuccessful
      	render story_path(Story.find(@comment.story_id))
    end
  end

  def update
  end

  def destroy
  	@comment.destroy
    redirect_to root_path
  end

  private

    def correct_user
      @comment = current_user.comments.find_by_id(params[:id])
      redirect_to root_path if @comment.nil?
    end
end