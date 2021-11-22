class ApplicationController < ActionController::Base
  include UsersHelper
    
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  # rescue_from ActiveRecord::RecordNotFound :with :record_not_found
  # rescue_from 處理例外的方法 with: 要執行的方法
  helper_method :user_signed_in?, :current_user
  
  private
  def record_not_found
    render file: 'public/404.html', layout: false, status: 404
  end

  def user_signed_in?
    session[:recognize].present?
  end

  def current_user
    @current_user || User.find(session[:recognize])
  end
end
end
