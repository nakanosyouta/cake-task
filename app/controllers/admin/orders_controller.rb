class Admin::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_customer.addresses.all
  end
  
  def indx
    @orders = Order.all
  end
  
  def show
   @order = Order.find(params[:id])
   @order_details = OrderDetail.find(params[:id])
  end
end
