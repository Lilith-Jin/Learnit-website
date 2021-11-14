class UsersController < ActionController::Base
  def sign_up
  end

  def account_verify
    #不需要出現畫面，快速轉址到首頁
    redirect_to "/"
  end
end
