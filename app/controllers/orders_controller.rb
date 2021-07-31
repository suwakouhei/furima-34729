class OrdersController < ApplicationController
  def index
    @purchase_address = PurchaseStreetAdress.new
  end
  def create
    @purchase_address = PurchaseStreetAdress.new(purchase_address_params)
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
  params.require(:purchase_address).permit(:postal_code, :prefectures_id, :municipality, :address, :phone_number,:building_name).merge(user_id: current_user.id, list_id: current_list.id, token: params[:token])
end

def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        card: purchase_address_params[:token], 
        currency: 'jpy'
      )
end


