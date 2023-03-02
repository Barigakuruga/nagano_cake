class Public::OrdersController < ApplicationController
  def new
    @customer = current_customer
    @address = current_customer.addresses
  end

  def confirm
  end

  def thanx
  end

  def index
  end

  def show
  end
end
