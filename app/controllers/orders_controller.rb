class OrdersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_item, only: [:index, :create]
  
    def index
      @order_form = OrderForm.new
    end
  
    def create
      @order_form = OrderForm.new(order_params)
      if @order_form.valid?
        pay_item
        
         @order_form.save
        redirect_to root_path
      else
        render :index, status: :unprocessable_entity
      
      end
    end
  
    private
  
    def order_params
      params.require(:order_form).permit(:post_code, :item_prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end

    def pay_item
      Payjp.api_key = "sk_test_687c2fb568e785bef9973258"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
        Payjp::Charge.create(
          amount: @item.item_price,  # 商品の値段
          card: order_params[:token],    # カードトークン
          currency: 'jpy'                 # 通貨の種類（日本円）
        )
      )
    end

  
    def set_item
      @item = Item.find(params[:item_id])
    end
  end
