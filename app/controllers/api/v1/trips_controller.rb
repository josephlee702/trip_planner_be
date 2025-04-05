class Api::V1::TripsController < ApplicationController
  before_action :set_trip, only: [:show, :update, :destroy]

  def index
    user = User.find_by(email: request.headers[:uid])
    require 'pry'; binding.pry
    if user
      render json: user.trips.as_json, status: :ok
    else
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end

  def show
    render json: @trip.as_json, status: 200
  end

  def create
    trip = trip.new(trip_params)

    if trip.save
      render json: trip, status: 201
    else
      render json: { error: trip.errors.full_messages }, status: 402
    end
  end

  def update
    if @trip.update(trip_params)
      render json: @trip, status: 200
    else
      render json: { error: @trip.errors.full_messages }, status: 402
    end
  end

  def destroy
    @trip.destroy
    render json: { message: "Your trip was deleted successfully." }, status: 200
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :user_id)
  end
  
  #designates trip to perform show, update and destroy actions on
  def set_trip
    @trip = trip.find_by(id: params[:id])
    render json: { error: "Trip not found." }, status: 404 unless @trip
  end
end
