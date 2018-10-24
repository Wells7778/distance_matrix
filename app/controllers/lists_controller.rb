class ListsController < ApplicationController
  def index
    @list = List.new
    @lists = List.all.order(created_at: :desc).page(params[:page]).per(20)
  end

  def show
    @list = List.find_by(id: params[:id])
    priority_lists = @list.results.priority
    tmp_lists = @list.results.includes(:service).order("distance asc")
    @lists = (priority_lists | tmp_lists).uniq
    @img_url = "//maps.googleapis.com/maps/api/staticmap?center=#{@list.latlng}&size=600x300&zoom=15&language=zh-TW&key=#{$settings['secret']}"
  end

  def create
    @list = List.new(list_params)
    result = list_params[:latlng].blank? ? Search.geocode(list_params[:address]) : Search.geocode(list_params[:latlng])
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