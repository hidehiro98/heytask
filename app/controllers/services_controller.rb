class ServicesController < ApplicationController
  before_action :set_service, only: [ :show, :destroy ]
  before_action :set_user, only: [ :new, :create ]

  def index
    @services = Service.all
  end

  def show
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    @service.provider = @user

    if @service.save
      redirect_to service_path(@service)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def service_params
    params.require(:service).permit(:name, :category, :description, :photo, :photo_cache, :price, :provider_id)
  end
end
