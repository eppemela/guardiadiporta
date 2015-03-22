class StationsController < ApplicationController
  before_action :set_station, only: [:show, :update, :destroy]

  # GET /stations
  # GET /stations.json
  def index
    @stations = Station.all

    render json: @stations
  end

  # GET /stations/1
  # GET /stations/1.json
  def show
    render json: @station
  end

  # POST /stations
  # POST /stations.json
  def create
    @station = Station.new(station_params)

    if @station.save
      render json: @station, status: :created, location: @station
    else
      render json: @station.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stations/1
  # PATCH/PUT /stations/1.json
  def update
    @station = Station.find(params[:id])

    if @station.update(station_params)
      head :no_content
    else
      render json: @station.errors, status: :unprocessable_entity
    end
  end

  # DELETE /stations/1
  # DELETE /stations/1.json
  def destroy
    @station.destroy

    head :no_content
  end

  private

    def set_station
      @station = Station.find(params[:id])
    end

    def station_params
      params.require(:station).permit(:name)
    end
end
