module UsersHelper
  def user_signed_in?
    session[:recognize].present?
  end
end