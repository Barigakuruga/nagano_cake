class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @order = Order.new
    @customer = current_customer
    @address = current_customer.addresses
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    @order.save
      cart_items.each do |cart|
        order_detail = OrderDetail.new
        order_detail.item_id = cart.item_id
        order_detail.order_id = @order.id
        order_detail.amount = cart.amount
        order_detail.price = cart.item.with_tax_price
        order_detail.save
      end
    redirect_to orders_thanx_path
    cart_items.destroy_all
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
      # 未実装のためコメントアウト 
    #elsif params[:order][:select_address] == "1"
      #@address = Address.find(params[:order][:address_id])
      #@order.postal_code = @address.postal_code
      #@order.address = @address.address
      #@order.name = @address.name
    end
  end

  def thanx
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :postal_code, :address, :name, :total_payment)
  end

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
