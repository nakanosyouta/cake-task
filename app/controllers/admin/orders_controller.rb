class Admin::OrdersController < ApplicationController
  def new

  end

  def index
    @orders = Order.all
  end

  def edit
    @customer = Customer.find(params[:id])
    @orders = @customer.orders
  end

  def show
   @order = Order.find(params[:id])
   @order_details = OrderDetail.find(params[:id])
  end
end
