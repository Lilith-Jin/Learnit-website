class UsersController < ActionController::Base
  def sign_up
    @user = User.new
  end

  def account_verify
   #限定(:username, :password, :email)是ok的
    clean_params = params.require(:user).permit(:username, :password, :email)
    @user = User.new(clean_params)

    if @user.save
    #快速轉址到首頁
      redirect_to "/"
    else
    end
  end
end
