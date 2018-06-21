class DistancesController < ApplicationController
  def index
    @distance = Distance.new
    @distances = Distance.all
  end

  def show
    @distance = Distance.find_by(id: params[:id])
    @lists = @distance.respond_list
  end

  def create
    @distance = Distance.new(dis_params)
    geo_address = Distance.geocode(dis_params[:address])
    @distance.post_code = geo_address.chomp.slice(0..1)
    @distance.geo_address = geo_address
    @distance.respond_list = @distance.cal_distance.sort_by { |element| element['distance'] }
    @distance.save

    redirect_to distance_path(@distance)
  end

  private
  def dis_params
    params.require(:distance).permit(:address)
  end
end