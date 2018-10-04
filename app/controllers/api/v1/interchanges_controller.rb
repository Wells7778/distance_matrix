class Api::V1::InterchangesController < ApiController
  def index
    @interchanges = Interchange.all
    render json: {
      data: @interchanges.map do |interchange|
        {
          name: interchange.name,
          coordsNW: interchange.coordsNW,
          coordsSE: interchange.coordsSE
        }
      end
    }
  end
end
