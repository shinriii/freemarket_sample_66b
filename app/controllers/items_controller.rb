class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def confirm
    @item = Item.find(params[:item_id])
  end
  require 'payjp'

  def purchase
    Payjp.api_key = ENV["PAYJP_ACCESS_KEY"]
    @item = Item.find(params[:item_id])
    Payjp::Charge.create(
      amount: @item.price, 
      card: params['payjp-token'], 
      currency: 'jpy'
    )
  end

  def new
    @item = Item.new
  end

  def create
    # binding.pry
    Item.create(item_params)
    redirect_to root_path
  end

  def show
    @item = Item.find(params[:item_id])
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :price, :condition_id, :prefecture_id, :delivery_days_id, :delivery_burden_id, :category_id)
  end
  
end

