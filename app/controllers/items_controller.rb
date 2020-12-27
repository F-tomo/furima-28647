class ItemsController < ApplicationController

  def index
    
  end

  before_action :authenticate_user!, only: [:new, :create]

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
  
  private

  def item_params
    params.require(:item).permit(
      :content, :image, :name, :discription, :price, :category_id, :condition_id, :postage_id, :prefecture_id, :hold_date_id
      ).merge(user_id: current_user.id)
  end

end
