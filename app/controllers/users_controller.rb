class UsersController < ApplicationController
  def sign_up  
    @user = User.new
    # @user = User.new (email: "aa@aa.cc", username: "c") 自動長好欄位內容
  end

  def account_verify
   #限定(:username, :password, :email)是ok的
    clean_params = params.require(:user).permit(:username, :password, :email)
    @user = User.new(clean_params)

    if @user.save
    #快速轉址到首頁
      # redirect_to "/sign_up"
      redirect_to "/"
    else
      #render 不跳轉 只做渲染畫面
      render :sign_up
    end
  end
end
