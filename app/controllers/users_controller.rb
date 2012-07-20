class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :show]
  # before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: [:destroy, :edit, :update, :create, :new, :toggle_admin]

  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
    @stories = @user.stories.paginate(page: params[:page])
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
      sign_in @user
      if @user.position == "Editor and Chief"
        @user.toggle!(:admin) 
      end
  		flash[:success] = "Member has been created!"
  		redirect_to admin_path
  	else
  		render 'new'
  	end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end

  def toggle_admin
    @user = User.find(params[:id])
    @user.toggle!(:admin)
    redirect_to user_path(@user)
  end

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
