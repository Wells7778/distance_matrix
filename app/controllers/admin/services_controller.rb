class Admin::ServicesController < Admin::BaseController
  before_action :set_service, only: [:edit, :update, :destroy]
  def index
    @ransack = Service.order("no asc").ransack(ransack_params)
    @services = @ransack.result(distinct: true).page(params[:page]).per(20)
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    @service.post_code = service_params[:no][0..1]
    @service.save
    redirect_to admin_root_path
  end

  def update
    @service.update(service_params)
    redirect_to admin_root_path
  end

  def destroy
    @service.destroy
    redirect_to admin_root_path
  end

  def import
    GoogleSheet.get_sheet_array_from_google_sheet.each do |service|
      status = service[:status] == "T" ? true : false
      if Service.find_by(no: service[:no]).nil?
        Service.create(
          no: service[:no],
          tag: service[:tag],
          name: service[:name],
          lat: service[:lng],
          lng: service[:lat],
          post_code: service[:post_code],
          service_time: service[:service_time],
          priority: service[:priority],
          status: status )
      else
        Service.find_by(no: service[:no]).update(
          tag: service[:tag],
          name: service[:name],
          lat: service[:lng],
          lng: service[:lat],
          post_code: service[:post_code],
          service_time: service[:service_time],
          priority: service[:priority],
          status: status )
      end
    end
  end

  def export
    @services = Service.all.order(no: :asc)
    render "export.xlsx.axlsx"
  end


  private

  def service_params
    params.require(:service).permit(:tag, :no, :name, :lat, :lng, :post_code, :service_time, :priority, :status)
  end

  def set_service
    @service = Service.find_by(id: params[:id])
  end
  def ransack_params
    if params[:q]
      params[:q].permit(:s, :name_cont, :no_cont)
    end
  end
end
