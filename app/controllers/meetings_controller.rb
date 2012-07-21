class MeetingsController < ApplicationController
  before_filter :signed_in_user
  before_filter :admin_user, only: [:new, :edit, :create, :update, :destroy]

  def index
   @meetings = Meeting.paginate(page: params[:page])
  end

  def show
    @meeting = Meeting.find(params[:id])

  end

  def new
    @meeting = Meeting.new
  end

  def edit
    @meeting = Meeting.find(params[:id])
  end

  def create
    @meeting = Meeting.new(params[:meeting])

      if @meeting.save
        flash[:success] = "Meeting created!"
        redirect_to @meeting
      else
        render action: "new"
      end
  end

  def update
    @meeting = Meeting.find(params[:id])

      if @meeting.update_attributes(params[:meeting])
        flash[:success] = "Meeting updated!"
        redirect_to @meeting 
      else
        render action: "edit" 
      end
  end

  def destroy
    @meeting = Meeting.find(params[:id]).destroy
    flash[:success] = "Meeting deleted."
    redirect_to meetings_path
  end

  private 
    def admin_user
      redirect_to(root_path) unless !current_user.nil? && current_user.admin?
    end
end
