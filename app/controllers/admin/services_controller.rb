class Admin::ServicesController < ApplicationController
  before_action :set_service, only: [:update, :destroy]
  def index
    @services = Service.all
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
end
