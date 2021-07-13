class ItemsController < ApplicationController
  def index
    if user_signed_in?
      redirect_to new_user_session
    else
      render :new
    end
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to root_path

    else
      render :new

    end
  end

  private

  def list_params
    params.require(:list).permit(:image, :item_name, :item_description, :item_category_id, :item_status_id, :delivery_burden_id,
                                 :prefecture_id, :shipping_day_id, :item_price).merge(user_id: current_user.id)
  end
end
