class Admin::InterchangesController < Admin::BaseController
  before_action :set_freeway, only: :index
  before_action :set_interchange, only: [:edit, :update, :destroy]
  def index
    @freeways = Freeway.all
    if params[:freeway_id]
      @interchanges = @freeway.interchanges.order(km: :asc)
    end
    @interchange = Interchange.new
  end

  def create
    @interchange = Interchange.new(interchange_params)
    @interchange.save
    redirect_to admin_interchanges_path(freeway_id: interchange_params[:freeway_id])
  end

  def edit
    @freeway = @interchange.freeway
  end

  def update
    @interchange.update(interchange_params)
    redirect_to admin_interchanges_path(freeway_id: @interchange.freeway.id)
  end

  def destroy
    @interchange.destroy
    redirect_to admin_interchanges_path(freeway_id: @interchange.freeway.id)
  end


  private

  def interchange_params
    params.require(:interchange).permit(:name, :cityNW, :citySE, :km, :coordsNW, :coordsSE, :freeway_id)
  end

  def set_interchange
    @interchange = Interchange.find(params[:id])
  end

  def set_freeway
    @freeway = Freeway.find_by(id: params[:freeway_id])
  end

end