class Admin::InterchangesController < Admin::BaseController
  before_action :set_freeway
  def index
    @freeways = Freeway.all
    if params[:freeway_id]
      @interchanges = @freeway.interchanges
      @id = params[:freeway_id]
    end
  end

  private
  def set_freeway
    @freeway = Freeway.find_by(id: params[:freeway_id])
  end

end
