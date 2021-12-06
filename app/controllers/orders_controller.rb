class OrdersController < ApplicationController
  before_action :authenticated!

  def create
    @course = Course.find(params[:course_id])
    @order = current_user.orders.build(order_params)
    @order.course = @course

    if @order.save
      redirect_to root_path, notice: "課程購買成功"
    else
      #render
    end
    # redirect_to courses_path
  end

  private
  def order_params
    params.require(:order).permit(:recipient, :address)
  end
end

