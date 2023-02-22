class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @status = @order
    @order_details = @order.order_details
  end

  def update
    @status = Order.find(params[:id])
    @status.update(order_params)
    redirect_to admin_order_path(@status.id)
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end
  
end
