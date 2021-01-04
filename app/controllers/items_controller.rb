class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_item, only: [:edit, :show]

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
    # item = Item.find(params[:id])
    # item.destroy
  end

  def edit
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to item
    else
      set_item
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

end
