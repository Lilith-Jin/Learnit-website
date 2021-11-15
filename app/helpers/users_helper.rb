module UsersHelper
  def user_sign_in?
    session[:recognize].present?
  end
end