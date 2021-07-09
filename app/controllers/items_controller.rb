class ItemsController < ApplicationController
  def index
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to root_path
  end

  private

  def list_params
    params.require(:list).permit(:item_name,:item_description,:item_category_id,:item_status_id,:delivery_burden_id,:prefectures_id,:shipping_days_id,:item_price,)
  end

end
