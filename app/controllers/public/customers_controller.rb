class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session

    redirect_to root_path
  end

  def update
    @customer = current_customer
    if  @customer.update(customer_params)
    redirect_to my_page_path
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
