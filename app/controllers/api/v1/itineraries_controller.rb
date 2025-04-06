class Api::V1::ItinerariesController < ApplicationController
  before_action :set_itinerary, only: [:show, :update, :destroy]

  def index
    user = User.find_by(email: request.headers[:uid])
    
    if user
      trip = user.trips.find_by(id: params[:trip_id])

      if trip
        render json: trip.itineraries, status: :ok
      else
        render json: { error: "Unauthorized" }, status: :unauthorized
      end
    end
  end

  def show
    render json: @itinerary.as_json, status: 200
  end

  def create
    itinerary = Itinerary.new(itinerary_params)

    if itinerary.save
      render json: itinerary, status: 201
    else
      render json: { error: itinerary.errors.full_messages }, status: 402
    end
  end

  def update
    if @itinerary.update(itinerary_params)
      render json: @itinerary, status: 200
    else
      render json: { error: @itinerary.errors.full_messages }, status: 402
    end
  end

  def destroy
    @itinerary.destroy
    render json: { message: "Your itinerary was deleted successfully." }, status: 200
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:name, :description, :start_date, :end_date, :user_id, :trip_id)
  end
  
  #designates itinerary to perform show, update and destroy actions on
  def set_itinerary
    @itinerary = Itinerary.find_by(id: params[:id])
    render json: { error: "Trip not found." }, status: 404 unless @trip
  end
end
