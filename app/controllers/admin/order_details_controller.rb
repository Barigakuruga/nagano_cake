class Admin::OrderDetailsController < ApplicationController
  def update
    @making_status = OrderDetail.find(params[:id])
    @making_status.update(making_status_params)
    @making_statu = @making_status.order
    redirect_to admin_order_path(@making_statu.id)
  end

  private
  def making_status_params
    params.require(:order_detail).permit(:making_status)
  end
end
