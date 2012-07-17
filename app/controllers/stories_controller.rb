class StoriesController < ApplicationController
  before_filter :signed_in_user

  def new
  	@story = Story.new
  end

  def create
  	@story = current_user.stories.build(params[:story])
  	if @story.save
  		flash[:success] = "Story created!"
  		redirect_to @story
  	else
  		render 'new'
  	end
  end

  def index
    @stories = Story.paginate(page: params[:page])
  end

  def show
  	@story = Story.find(params[:id])
  end

  def destroy
  end
end