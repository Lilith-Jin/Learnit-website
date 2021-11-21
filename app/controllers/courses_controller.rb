class CoursesController < ApplicationController
  def
    index
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
end


private
def course_params
  clean_params = params.require(:course).permit(:name, :price, :intro, :hour)
end