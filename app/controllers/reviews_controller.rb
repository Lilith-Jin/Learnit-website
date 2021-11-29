class ReviewsController < ApplicationController
  before_action :authenticated! #沒登入就不能往下走

  def create
    #哪一門課
    course = Course.find(params[:course_id])

    @review = course.reviews.build(review_params)#用課的角度，review的內容清洗過
    # @review.user_id = current_user.id #將使用者灌給review，用merge就可以省略此行

    if @review.save
      # redirect_to course_path(course), notice: 'commented!'以JS渲染，不換頁
    else
      #
    end
    # render html: params
  end

  private
  def review_params
    # params.require(:review).permit(:rating, :title, :content)
    params.require(:review).permit(:rating, :title, :content).merge(user: current_user)
  end

end
