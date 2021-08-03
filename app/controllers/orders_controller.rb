class OrdersController < ApplicationController
  def index
    @list = List.find(params[:item_id])
    @purchase_address = PurchaseStreetAddress.new
    if current_user == @list.user
      redirect_to root_path
    end
    if @list.purchase != nil 
      return root_path
    end 
    if user_signed_in?
      
    else
      redirect_to  new_user_session_path
    end

  end

  def create
    @list = List.find(params[:item_id])
    @purchase_address = PurchaseStreetAddress.new(purchase_address_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end
end

private

def purchase_address_params
  params.require(:purchase_street_address).permit(:postal_code, :prefectures_id, :municipality, :address, :phone_number, :building_name).merge(
    user_id: current_user.id, list_id: params[:item_id], token: params[:token]
  )
end

def pay_item
  Payjp.api_key = ENV['PAYJP_SECRET_KEY']
  Payjp::Charge.create(
    amount: @list.item_price,
    card: purchase_address_params[:token],
    currency: 'jpy'
  )
end
