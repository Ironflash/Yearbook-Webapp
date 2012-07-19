class CommentsController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user,   only: :destroy

  def create
  	@comment = current_user.comments.build(params[:comment])
    if @comment.save 
 		   redirect_to story_path(Story.find(@comment.story_id))
    else
       redirect_to story_path(Story.find(@comment.story_id))
    end
  end

  def destroy
  	@comment.destroy
    redirect_to story_path(Story.find(@comment.story_id))
  end

  private

    def correct_user
      @comment = current_user.comments.find_by_id(params[:id])
      redirect_to root_path if @comment.nil?
    end
end