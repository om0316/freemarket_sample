class ItemsController < ApplicationController
  def index

  end

  def new
    @item = Item.new
    @item.images.new

    @category = Category.all
  end

  def create
    
    #ブランドの入力があればデータ取得、なければ登録
    brand_info = Brand.where(name: params[:item][:brand_id]);
    if brand_info.length == 0 && params[:item][:brand_id] != nil
      brand = Brand.new(name:params[:item][:brand_id])
      brand.save
      brand_id = brand[:id]
    else
      brand_id = brand_info[0][:id]
    end 

    @item = Item.new(item_params) 
    @item.brand_id = brand_id
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def item_params
    params.require(:item).permit(:name, :detail, :category_id,
                                 :status, :shipping_burden,
                                 :shipping_way, :shipping_place,:shipping_day,
                                 :price, images_attributes: [:image]).merge(user_id: current_user.id)
  end
end
