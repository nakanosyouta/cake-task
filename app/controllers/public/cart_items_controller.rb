class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total = 0
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    
    
    
    
    if CartItem.exists?(customer_id: current_customer.id, item_id: @cart_item.item_id)
      CartItem.find_by(customer_id: current_customer.id, item_id: @cart_item.item_id).update(amouunt: CartItem.find_by(customer_id: current_customer.id, item_id: @cart_item.item_id).amouunt+@cart_item.amouunt)
      redirect_to cart_items_path
    elsif @cart_item.save
      redirect_to cart_items_path
    else
      @cart_items = CartItem.all
      render :index
    end
  end

  def update
    @cart_item_param = CartItem.find(params[:id])
    if @cart_item_param.update(cart_item_params)
        redirect_to cart_items_path
    else
        render :index
    end

  end

  def destroy
    @cart_item_param = CartItem.find(params[:id])
    @cart_item_param.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end



  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amouunt)
  end
end
