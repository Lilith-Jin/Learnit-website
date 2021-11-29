class ApplicationController < ActionController::Base
  include UsersHelper
    
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  # rescue_from ActiveRecord::RecordNotFound :with :record_not_found
  # rescue_from 處理例外的方法 with: 要執行的方法
  helper_method :user_signed_in?, :current_user
  # 因為要給view helper是給view用的，移到comtroller要用helper_method呼叫
  # :user_signed_in?, :current_user是流程控制，放comtroller優於helper

  private
  def record_not_found
    render file: 'public/404.html', layout: false, status: 404
  end

  def user_signed_in?
    session[:recognize].present?
  end

  def current_user
    #memorization 同一個畫面抓過的資料不用再抓
    @current_user || User.find(session[:recognize])
    # 翻譯 : 如果有@current_user就用，沒有就執行User.find(session[:recognize])
    # @current_user是在user登入後有新增/修改/刪除時執行，只要執行過1次，登入狀態下的其他操作不需要向資料庫查資料
  end

  def authenticated!
    #   #如果沒登入，轉去登入頁面
    #   # if not user_signed_in?
    #   # if session[:recognize] == nil
    #     # redirect_to sign_up_path
    #   # end
      redirect_to sign_in_path flash[:notice]='請先登入會員' unless user_signed_in?
    
    end
end

