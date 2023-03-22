class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @articles = Article.where(customer_id: current_customer.id)
  end

  def edit
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customer_path(@customer)
    else
      render "edit"
    end
  end
  
  def withdrawal_check
    @customer = current_customer
    if @customer.update(is_deleted: true)
      reset_session
      flash[:notice] = "SummaMeを退会しました"
      redirect_to root_path
    end
  end
  
  def withdrawal
  end
  
  private

  def customer_params
    params.require(:customer).permit(:name, :email)
  end
  
end
