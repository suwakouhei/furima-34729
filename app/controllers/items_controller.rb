class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create,:edit,:update]
  before_action :one_get_list, only: [:show,:edit,:update]
  before_action :move_to_root, only: :edit


  def index
    @lists = List.all.order('created_at DESC')
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

  def show
    
  end

  def edit
    
  end

  def update
    
    if @list.update(list_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def list_params
    params.require(:list).permit(:image, :item_name, :item_description, :item_category_id, :item_status_id, :delivery_burden_id,
                                 :prefecture_id, :shipping_day_id, :item_price).merge(user_id: current_user.id)
  end


  def move_to_root
    unless current_user == @list.user
      redirect_to root_path
    end 
  end
  
  def one_get_list
    @list = List.find(params[:id])
  end


end
