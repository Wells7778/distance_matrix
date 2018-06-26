class Admin::ServicesController < ApplicationController
  before_action :set_service, only: [:update, :destroy]
  def index
    @ransack = Service.order("no asc").ransack(ransack_params)
    @services = @ransack.result(distinct: true).page(params[:page]).per(20)
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    @service.post_code = service_params[:no][0]
    @service.save
    redirect_to admin_root_path
  end

  def update
    @service.update(form_params)
    redirect_to admin_root_path
  end

  def destroy
    @service.destroy
    redirect_to admin_root_path
  end

  private

  def service_params
    params.require(:service).permit(:tag, :no, :name, :lat, :lng, :post_code)
  end

  def form_params
    params.permit(:tag, :no, :name, :lat, :lng, :post_code)
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
