class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_my_page_path
    else
      render "edit"
    end
  end
  
  def withdrawal_check
  end
  
  def withdrawal
  end
  
  private

  def customer_params
    params.require(:customer).permit(:name, :email)
  end
  
end
