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
    @distance.respond_list = Distance.cal_distance(dis_params[:address]).sort_by { |element| element['distance'] }
    @distance.save

    redirect_to distance_path(@distance)
  end

  private
  def dis_params
    params.require(:distance).permit(:address)
  end
end