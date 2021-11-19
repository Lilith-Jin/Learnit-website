class UsersController < ApplicationController
  def sign_up  
    @user = User.new
    # @user = User.new (email: "aa@aa.cc", username: "c") 自動長好欄位內容
  end

  def account_verify
   #限定(:username, :password, :email)是ok的，其餘過濾掉
    @user = User.new(user_params)

    if @user.save
    #快速轉址到首頁
      # redirect_to "/sign_up"
      redirect_to "/"
    else
      #render 不跳轉 只做渲染畫面
      render :sign_up
    end
  end

  def sign_in
    @user = User.new
  end
  
  def check
    u = User.login(params[:user])
    if u
      session[:recognize] = u.id
      redirect_to "/"
    else
      render html: "no user"
    end
  end

  private
  #check/account_verify時會被重複使用clean_params 所以定義方法user_params放在private
  def user_params
    clean_params = params.require(:user).permit(:username, :password, :email)
  end
end
