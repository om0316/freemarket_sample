class ItemsController < ApplicationController


  def index
    
  end

  def new
    @item = Item.new
    @item.images.new
  
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

     #カテゴリー登録
    if params[:grandchild] == nil || params[:grandchild] == ""
      if params[:child] != ""
        @item.category_id = params[:child]
      else
      end
    else
      @item.category_id = params[:grandchild]
    end  

    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def search
   
    if params[:parent]
      @child_categories = Category.where('ancestry = ?', "#{params[:parent]}")
    else
      @grandchild_categories = Category.where('ancestry LIKE ?', "%/#{params[:child]}")
    end
   
    respond_to do |format|
      format.html
      format.json
    end
  end

  def item_params
    params.require(:item).permit(:name, :detail, :category_id,
                                 :status, :shipping_burden,
                                 :shipping_way, :shipping_place,:shipping_day,
                                 :price, images_attributes: [:image]).merge(user_id: current_user.id)
  end
end
