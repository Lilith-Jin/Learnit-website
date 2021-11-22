class CoursesController < ApplicationController

  before_action :set_course, only:[:edit, :update, :destroy]
  def index
    @courses = Course.all
  end

  def
    new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
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
      flash[:notice] = "編輯成功"
      redirect_to courses_path
    else
      render :edit
    end
  end

  def destroy
    @course = Course.find_by(id: params[:id])
    @course.destroy
    flash[:notice] = "刪除一筆資料"
    redirect_to courses_path
  end
end


private

def set_course
  @course = Course.find_by(id: params[:id])
end

def course_params
  clean_params = params.require(:course).permit(:name, :price, :intro, :hour)
end