class CoursesController < ApplicationController

  before_action :set_course, only: [:edit, :update, :destroy]
  before_action :authenticated!, except: [:index, :show]

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def show
    @course = Course.find_by(id: params[:id])
    @review = Review.new
    # @reviews = Review.where(course_id: @course.id) 省略
    # @reviews是getter，因為關聯性的關係自動長好
    @reviews = @course.reviews.order(id: :desc)

    #lazy loading 要用再印出來
    #order(id: :desc) 透過資料庫撈出來的資料，做反向排序
  end
    #buy要寫在course裡面
  def buy
    #因為order路徑包到coursex裡面，所以要找到他的id
    @course = Course.find_by(id: params[:id])
    @order = Order.new
  end

  def create
    # @course = Course.new(course_params) 無判斷使用者狀態
    @course = current_user.courses.build(course_params)

    if @course.save
      flash[:notice] = "課程新增成功"
      redirect_to courses_path
    else
      render:new
    end
  end

  def edit
    @course = Course.find_by(id: params[:id])
  end

  def update
    @course = Course.find_by(id: params[:id])
    
    if @course.update(course_params)
      flash[:notice] = "課程編輯成功"
      redirect_to courses_path
    else
      render :edit
    end
  end

  def destroy
    @course = Course.find_by(id: params[:id])
    @course.destroy
    flash[:notice] = "刪除一筆課程"
    redirect_to courses_path
  end
end


private

def set_course
  # @course = Course.find_by(id: params[:id])
  #目前使用者的id要跟課程id對上，否則會跳出例外訊息
  begin
    @course = current_user.courses.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render file: 'public/404.html', layout: false, status: 404
    #layout: false ->不顯示flash和e-mail status: 404->預設會出現202，因為只是例外非錯誤
    # redirect_to root_path
    # flash[:notice] = "查無資料"

  end
end

# def login?
#   #如果沒登入，轉去登入頁面
#   # if not user_signed_in?
#   # if session[:recognize] == nil
#     # redirect_to sign_up_path
#   # end
#   redirect_to sign_in_path flash[:notice]='請先登入會員' unless user_signed_in?

# end

def course_params
  clean_params = params.require(:course).permit(:name, :price, :intro, :hour)
end
