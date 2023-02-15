class Admin::HomesController < ApplicationController
  def top
    @orders = orders.page(params[:page])
  end
end
