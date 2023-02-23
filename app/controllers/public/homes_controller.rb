class Public::HomesController < ApplicationController
  def top
    @items = Item.order("id DESC")
  end

  def about
  end
end
