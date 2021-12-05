class Api::V1::CoursesController < ApplicationController
  # 不要用，除非只是單純公開api
  # skip_before_action :verify_authenticity_token
  before_action :check_login

  def like
    #找course，先用區域變數
    #找不到會出現404(之前寫在ApplicationController)
    course = Course.find(params[:id]) 
    # 以coure的角度加到我的最愛
    # course.favorite_users << current_user(與14行擇一寫)
    # course.favorite_users = [current_user] (與上面寫法相同，擇一)
    
    # 按讚資料表有沒有這堂課
    favorite_course = FavorCourse.find_by(user: current_user, course: course)

    if favorite_course
      #有的話就刪除
      favorite_course.destroy
      render json: { status: "unlike"} 
    else
      #沒有的話以user角度加到我的最愛
      current_user.favorite_courses << course 
      render json: { status: "like"} 
    end
    
  end

  private
  #每次按讚前判斷是否登入
  def check_login
     #early return
     if not user_signed_in?
      render json: { status: "fail", message: "You need to login first"},status:401
      return
    end
  end
  
end
