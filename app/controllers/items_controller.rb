class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show ]
  before_action :set_item, only: [:show, :edit, :update, :destroy]


  def new
    @item = Item.new
  end


  def index
    @items = Item.includes(:user).order('created_at DESC')
  end


  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

    def edit
    redirect_to root_path if current_user.id == @item.user_id
    end

  def destroy
    
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end


  def update
    if @item.valid?
      @item.update(item_params)
      redirect_to item_path(item_params)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_info, :item_category_id, :item_sales_status_id,
                                 :item_shipping_fee_status_id, :item_prefecture_id, :item_scheduled_delivery_id, :item_price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
