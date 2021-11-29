class UsersController < ApplicationController
  def sign_up  
    @user = User.new
    # @user = User.new (email: "aa@aa.cc", username: "c") 自動長好欄位內容
  end

  def account_verify
   
    @user = User.new(user_params)#限定(:username, :password, :email)是ok的，其餘過濾掉

    if @user.save
      #redirect_to快速轉址到首頁
      # redirect_to "/sign_up"
      redirect_to "/"
    else
      #render 不跳轉 借sign_up的view做渲染畫面
      render :sign_up
    end
  end

  def sign_in
    @user = User.new
  end
  
  def check
    #render html:params 看一下回傳了什麼內容
    # u = User.find_by(email: email, password: encryted_password)
    #註冊後的資料會存在params，把login的params指定給u
    u = User.login(params[:user])

    if u
      #將u.id想像成識別證，在sever存取session，之後到每個頁面就不用login
      session[:recognize] = u.id

      redirect_to "/"
    else
      render html: "no user"
    end
  end

  def sign_out
    session[:recognize] = nil
    # flash[:notice] = "已登出"
    redirect_to  courses_path
  end

  private
  #params是在user送出表單後會長出的一串資料，型態為hash
  #check/account_verify時會被重複使用clean_params 所以定義方法user_params放在private
  def user_params
    clean_params = params.require(:user).permit(:username, :password, :email)
  end
end
