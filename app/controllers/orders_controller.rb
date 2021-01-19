class OrdersController < ApplicationController
  before_action :set_item, only: %i[index create]
  before_action :move_to_root, only: %i[index create]
  before_action :move_to_index, only: %i[index create]

  def index
    @item_order = ItemOrder.new
  end

  def create
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      pay_item
      @item_order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(
      :post_code, :prefecture_id, :city, :house_number, :building, :phone, :item_id, :token
    ).merge(
      user_id: current_user.id
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root
    redirect_to root_path unless @item.order.nil?
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user.id
  end
end
