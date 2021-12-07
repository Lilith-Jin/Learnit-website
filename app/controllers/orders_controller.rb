class OrdersController < ApplicationController
  before_action :authenticated!

  def create
    @course = Course.find(params[:course_id])
    # @order = current_user.orders.build(order_params)
    # @order.course = @course
    # @order.amount = @course.price
    @order = @course.prepare_order(order_params)

    if @order.save
      # 先建訂單才刷卡，不然無法判別是誰的訂單
        gateway = Braintree::Gateway.new(
          :environment => :sandbox,
          :merchant_id => ENV['braintree_merchant_id'],
          :public_key => ENV['braintree_public_key'],
          :private_key => ENV['braintree_private_key']
          
        )
        
        result = gateway.transaction.sale(
          :amount => @order.amount,
          :payment_method_nonce => params[:nonce],
      )
        
        if result.success?
          # @order.update(state: "paid", paid_at: Time)
          @order.pay! if @order.may_pay?
          redirect_to root_path, notice: "購買課程成功"
        else
          redirect_to root_path, notice: "付款過程發生問題"
        end
  
      else
        #
      end
  end

  private
  def order_params
    params.require(:order).permit(:recipient, :address).merge(user: current_user)
  end
end

