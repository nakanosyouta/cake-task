class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
    
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
   
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    
    if params[:customer][:is_deleted] == "true"
     @customer.update(is_deleted: true)
     
    elsif params[:customer][:is_deleted] == "false"
      @customer.update(is_deleted: false)
    end
    redirect_to admin_customer_path(@customer)
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :addess, :telephone_number, :is_deleted)
  end

end
