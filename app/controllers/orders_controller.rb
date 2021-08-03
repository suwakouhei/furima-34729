class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :one_get_list, only: [:index, :create]
  before_action :purchase_present_back, only: [:index]


  def index
    @purchase_address = PurchaseStreetAddress.new
  end

  def create
    @purchase_address = PurchaseStreetAddress.new(purchase_address_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
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

def one_get_list
  @list = List.find(params[:item_id])
end

def purchase_present_back
  if (current_user == @list.user) && (@list.purchase != nil )
    redirect_to root_path
  end

end

end