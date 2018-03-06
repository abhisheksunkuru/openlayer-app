class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @locations_shared_by_me = Location.where(user: current_user)
    @public_shared_locations = Location.where(public: true)
    @locataions_shared_to_me = Location.where(to: current_user.email.to_s)

  end

  def show
    respond_with(@location)
  end

  def new
    @location = Location.new
    respond_with(@location)
  end

  def edit
  end

  def create
    @location = Location.new
    @location.user = current_user
    to = User.where(email: params[:email]).first.id rescue nil
    @location.to = params[:public] ? nil : to
    @location.lonlat = "POINT(#{params['lon']} #{params['lat']})"
    @location.save
    redirect_to '/'
  end

  def update
    @location.update(location_params)
    respond_with(@location)
  end

  def destroy
    @location.destroy
    respond_with(@location)
  end

  private
    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:lonlat, :from, :to, :public)
    end
end
