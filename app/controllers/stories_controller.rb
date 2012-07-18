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

  def update
  	@story = Story.find(params[:id])
    if @story.update_attributes(params[:story])
      flash[:success] = "Story status updated"
      redirect_to @story
    else
      render 'edit'
    end
  end

  def index
    @stories = Story.paginate(page: params[:page])
  end

  def show
  	@story = Story.find(params[:id])
  end

  def edit
  	@story = Story.find(params[:id])
  end

  def destroy
  	Story.find(params[:id]).destroy
    flash[:success] = "Story deleted."
    redirect_to stories_path
  end
end