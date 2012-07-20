class StaticPagesController < ApplicationController
  before_filter :admin_user, only: :admin

  def home
  end

  def help
  end

  def about
  end

  def contact
  end

  def history
  end

  def ordering
  end

  def portraits
  end

  def contracts
  end

  def sections
  end

  def employment
  end

  def awards
  end

  def faqs
  end

  def hall_of_fame
  end

  def privacy
  end

  def admin
    @update = HomepageUpdate.new
  end

  private 
  	def admin_user
      redirect_to(root_path) unless !current_user.nil? && current_user.admin?
    end
end
