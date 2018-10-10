class Api::V1::FreewaysController < ApiController
  def index
    @freeways = Freeway.all
    render json: {
      data: @freeways.map do |freeway|
        {
          id: freeway.id,
          name: freeway.name
        }
      end
    }
  end

  def show
    @freeway = Freeway.find_by(id: params[:id])
    @interchanges = @freeway.interchanges

    render json: {
      data: @interchanges.map do |i|
        {
          name: i.name,
          cityNW: i.cityNW,
          citySE: i.citySE,
          km: i.km,
          coordsNW: i.coordsNW,
          coordsSE: i.coordsSE
        }
      end
    }
  end


end
