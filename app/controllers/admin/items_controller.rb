class Admin::ItemsController < ApplicationController
  def index
    
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path(@item)
  end

  def show
  end

  def edit
  end
  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :genre_id, :is_active, :image)
  end
end