class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.all
    @adderss = Address.new(address_params)
  end
  
  def show
    
  end

  def edit
    @adderss = Address.find(params[:id])
  end
  
  def create
    @adderss = Address.new(address_params)
    if  @adderss.save
      redirect_to addresses_path
    end
      render :index
  end
  
  def update
    @adderss = Address.find(params[:id])
    if @adderss.update(address_params)
      redirect_to addresses_path
    else
       render :index
    end
  end
  
  def destroy
    @address_params_param = Address.find(params[:id])
    @address_params_param.destroy
    redirect_to addresses_path
  end
  
  private
  def address_params
    params.permit(:name, :postal_code, :address)
  end
  
end
