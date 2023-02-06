class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_customer.addresses.all
  end

  def confirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.addess
      @order.name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:address_option] == "1"
      ship = Address.find(params[:order][:address_id])
      @order.shipping_postal_code = ship.postal_code
      @order.shipping_address = ship.address
      @order.shipping_name = ship.name

    elsif params[:order][:address_option] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    else
      render 'new'
    end
     @order.shipping_cost = 800
    @cart_items = current_customer.cart_items.all
    @order.payment_method = params[:order][:payment_method]
    billing = 0
    @cart_items.each do |cart_item|
     billing += cart_item.subtotal
    end
    billing += @order.shipping_cost
    @order.total_payment = billing
  end

  def complete

  end

  def create
    @order = current_customer.orders.new(order_params)
    @total = 0
    @order.shipping_cost = 800
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @total += cart_item.subtotal
    end
    @order.total_payment = @total.to_i + @order.shipping_cost

    @order.save
    current_customer.cart_items.each do |cart_item|
      @order_details = OrderDetail.new
      @order_details.item_id = cart_item.item_id
      @order_details.amount = cart_item.amouunt
      @order_details.price = (cart_item.item.porice*1.1).floor
      @order_details.order_id = @order.id
      @order_details.save
    end
    current_customer.cart_items.destroy_all
    redirect_to orders_complete_path
  end

  def index
    @order = current_customer.orders.all
  end

  def show
   @order = Order.find(params[:id])
   @order_details = OrderDetail.find(params[:id])
   
  end

  private
def order_params
  params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :total_payment, :status)
end

end
