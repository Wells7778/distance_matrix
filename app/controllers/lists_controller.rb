class ListsController < ApplicationController
  def index
    @list = List.new
    @lists = List.all.order(created_at: :desc).page(params[:page]).per(20)
  end

  def show
    @list = List.find_by(id: params[:id])
    # 33801 文鹿 31001 竹東東昇 43504 梧棲有勝 81202 小港和義 82002 岡山和義
    tmp_lists = @list.services.includes(:results).order("results.distance asc")
    priority_lists = @list.services.where("priority > 0").includes(:results).where( "results.distance <= ?", 25999 )
    if priority_lists.exists?
      tmp_lists -= priority_lists
      @lists = priority_lists + tmp_lists
    else
      @lists = tmp_lists
    end
    @img_url = "//maps.googleapis.com/maps/api/staticmap?center=#{@list.latlng}&size=600x300&zoom=15&language=zh-TW&key=#{$settings['secret']}"
  end

  def create
    @list = List.new(list_params)
    result = Search.geocode(list_params[:address])
    if result.nil?
      flash[:alert] = "GOOGLE搜尋不到，請用鄉鎮區域搜尋"
      redirect_to root_path
    end
    if @list.latlng.blank?
      @list.latlng = result[:latlng]
    end
    @list.geo_address = result[:geo_address]
    @list.post_code = result[:post_code]
    @img_url = "//maps.googleapis.com/maps/api/staticmap?center=#{@list.latlng}&size=600x300&zoom=15&language=zh-TW&key=#{$settings['secret']}"
  end

  def cal_distance
    @list = List.new(list_params)
    @list.save
    flash[:notice] = "搜尋完成"
    redirect_to list_path(@list)
  end

  private
  def list_params
    params.require(:list).permit(:address, :geo_address, :latlng, :post_code)
  end
end