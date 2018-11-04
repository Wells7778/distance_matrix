class ListsController < ApplicationController
  def index
    @list = List.new
    @lists = List.all.order(created_at: :desc).page(params[:page]).per(20)
    @notes = Note.all.select(:content)
  end

  def show
    @list = List.find_by(id: params[:id])
    # 設定宜蘭與麥寮優先派遣固定服務點
    if @list.geo_address[0..2] == "638"
      first_service = Service.find_by(no: "63803").results.find_by(list_id: @list.id)
    elsif @list.post_code == "26" || @list.post_code == "27"
      first_service = Service.find_by(no: "27001").results.find_by(list_id: @list.id)
    end
    @lists = ( @list.results.priority_service | @list.results.includes(:service).order(priority: :desc).order("distance asc")).uniq
    @lists.insert(0,first_service).uniq! if first_service
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