class PlacesController < ApplicationController
  before_action :set_places, only:[:show, :edit, :update]
  
  def index
    @places = current_user.places
  end

  def show
  end

  def new
    @place = Place.new
  end

  def edit
  end

  def create
    @place = current_user.places.new(place_params)
    if @place.save
      flash[:success] = "Account Created"
      redirect_to places_path
    else
      flash[:error] = "Error #{@place.errors.full_messages.join('\n')}"
      render :new
    end
  end

  def update
    if @place.update(place_params)
      redirect_to places_path
    else
      render :edit
    end
  end

  def destroy
    @place.destroy
    redirect_to places_path
  end

  private

  def set_places
    @place = current_user.places.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :location)
  end

end
