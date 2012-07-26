class StoriesController < ApplicationController
  before_filter :signed_in_user
  before_filter :admin_user, only: [:edit, :update, :toggle_admin]

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
      flash[:success] = "story status updated"
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
    @comments = @story.comments.paginate(page: params[:page])
    @comment = current_user.comments.build if signed_in?
  end

  def edit
  	@story = Story.find(params[:id])
  end

  def destroy
  	Story.find(params[:id]).destroy
    flash[:success] = "Story deleted."
    redirect_to stories_path
  end

  private 
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end