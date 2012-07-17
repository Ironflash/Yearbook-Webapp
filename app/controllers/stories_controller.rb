class StoriesController < ApplicationController
  before_filter :signed_in_user

  def new
  	@story = Story.new
  end

  def create
  	@story = Story.new(params[:story])
  	if @story.save
  		flash[:success] = "Story created!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def index
    @stories = Story.paginate(page: params[:page])
  end

  def destroy
  end
end