class StaticPagesController < ApplicationController
  before_filter :admin_user, only: :admin

  def admin
    @update = HomepageUpdate.new
  end

  private 
  	def admin_user
      redirect_to(root_path) unless !current_user.nil? && current_user.admin?
    end
end
