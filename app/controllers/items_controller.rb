class ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  require 'payjp'

  def purchase
    Payjp.api_key = "秘密鍵"
    Payjp::Charge.create(
      amount: 809, # 決済する値段
      card: params['payjp-token'], # フォームを送信すると作成・送信されてくるトークン
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

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :price, :condition_id, :prefecture_id, :delivery_days_id, :delivery_burden_id, :category_id)
  end
  
end

