class Public::CartItemsController < ApplicationController
  def index
    @item = Item.find(params[:id])
    @cart_item = CartItem.find(params[:id])

  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save
      redirect_to public_cart_item_index
    end
    binding.pry
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amouunt)
  end
end
