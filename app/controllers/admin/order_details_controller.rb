class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details

    is_update = true
    if @order_detail.update(order_detail_params)
      @order.update(status: 2) if @order_detail.making_status == "production"
      @order_details.each do |order_detail|
        if order_detail.making_status != "completion_of_production"
          is_update = false
        end
      end
        @order.update(status: 3) if is_update == true
    end
    redirect_to admin_order_path(@order.id)
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
