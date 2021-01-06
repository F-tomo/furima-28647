class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destory]
  before_action :set_item, only: [:edit, :show, :update, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def destroy
    if user_confirmation
      @item.destroy
      redirect_to root_path
    end
  end

  def edit
    unless user_confirmation
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :content, :image, :name, :discription, :price, :category_id, :condition_id, :postage_id, :prefecture_id, :hold_date_id
      ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def user_confirmation
    confirmation = current_user.id == @item.user.id
  end
end
