class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if  @customer.update(customer_params)
    redirect_to customer_path(@customer.id)
    else
       render :show
    end
  end
  
  def unsubscribe
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :addess, :telephone_number)
  end
  
end