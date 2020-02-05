class ItemsController < ApplicationController
  before_action :set_item, only:[:destroy,:update,:edit]

  def index
    @items = Item.includes(:images).order('created_at DESC')
    @ladies = Item.where(parent_category_id:'1').order("created_at DESC").limit(10)
    @mens = Item.where(parent_category_id:'200').order("created_at DESC").limit(10)
    @elect = Item.where(parent_category_id:'898').order("created_at DESC").limit(10)

  end

  def confirm
    @item = Item.includes(:images).find(params[:item_id])
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
    redirect_to root_path
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def get_category_children
    @category_children = Category.find_by(id: "#{params[:parent_id]}",ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find_by(id: "#{params[:child_id]}").children
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      redirect_to root_path
    else
      new_item_path
    end
  end

  def show
    @item = Item.includes(:images).find(params[:item_id])
    @items = Item.find(params[:item_id])
  end

  def edit
    
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      edit_item_path
    end
  end

  def destroy 
    if @item.destroy
      redirect_to root_path
    else
      redirect_to item_path
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :price, :condition_id, :prefecture_id, :delivery_day_id, :delivery_burden_id, :parent_category_id, :child_category_id, :category_id, images_attributes: [:src]).merge(user_id: current_user.id)
  end
  
end

