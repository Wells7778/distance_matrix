class DistancesController < ApplicationController
  def index
    @distance = Distance.new
    @distances = Distance.all.order(created_at: :desc).page(params[:page]).per(20)
  end

  def show
    @distance = Distance.find_by(id: params[:id])
    # 33801 文鹿 31001 竹東東昇 43504 梧棲有勝 81202 小港和義 82002 岡山和義
    tmp_lists = @distance.respond_list
    @priority_lists = tmp_lists.select { |o| o['no'] == '33801' || o['no'] == '31001' || o['no'] == '43504'|| o['no'] == '81202'|| o['no'] == '82002'}.select { |o| o['distance'] <= 25999 }
    if @priority_lists.any?
      tmp_lists -= @priority_lists
      @lists = @priority_lists.sort_by { |element| element['distance'] } + tmp_lists
    else
      @lists = tmp_lists
    end
    @img_url = "//maps.googleapis.com/maps/api/staticmap?center=#{@distance.latlng}&size=600x300&zoom=15&language=zh-TW&key=#{$settings['secret']}"
  end

  def create
    @distance = Distance.new(dis_params)
    @address = dis_params[:address]
    @latlng = dis_params[:latlng]
    if @latlng.blank?
      result = Distance.geocode(dis_params[:address])
      @geo_address = result[:geo_address]
      @latlng = result[:latlng]
    else
      @geo_address = Distance.geocode(dis_params[:latlng])[:geo_address]
    end
    @img_url = "//maps.googleapis.com/maps/api/staticmap?center=#{@latlng}&size=600x300&zoom=15&language=zh-TW&key=#{$settings['secret']}"
    if @geo_address.nil?
      flash[:alert] = "GOOGLE搜尋不到，請用鄉鎮區域搜尋"
      redirect_to root_path
      # @distance.post_code = geo_address.chomp.slice(0..1)
      # @distance.geo_address = geo_address
      # @distance.respond_list = @distance.cal_distance.sort_by { |element| element['distance'] }
      # @distance.save
      # flash[:notice] = "搜尋完成"
      # redirect_to distance_path(@distance)
    end
  end

  def cal_distance
    @distance = Distance.new(dis_params)
    @geo_address = dis_params[:geo_address]
    @distance.post_code = @geo_address.chomp.slice(0..1)
    @distance.respond_list = @distance.cal_distance.sort_by { |element| element[:distance] }
    @distance.save
    flash[:notice] = "搜尋完成"
    redirect_to distance_path(@distance)
  end

  private
  def dis_params
    params.require(:distance).permit(:address, :geo_address, :latlng)
  end
end