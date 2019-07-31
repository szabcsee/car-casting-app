class VehicleFuelsController < ApplicationController
  before_action :set_vehicle_fuel, only: [:show, :edit, :update, :destroy]

  # GET /vehicle_fuels
  # GET /vehicle_fuels.json
  def index
    @vehicle_fuels = VehicleFuel.all
  end

  # GET /vehicle_fuels/1
  # GET /vehicle_fuels/1.json
  def show
  end

  # GET /vehicle_fuels/new
  def new
    @vehicle_fuel = VehicleFuel.new
  end

  # GET /vehicle_fuels/1/edit
  def edit
  end

  # POST /vehicle_fuels
  # POST /vehicle_fuels.json
  def create
    @vehicle_fuel = VehicleFuel.new(vehicle_fuel_params)

    respond_to do |format|
      if @vehicle_fuel.save
        format.html { redirect_to @vehicle_fuel, notice: 'Vehicle fuel was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle_fuel }
      else
        format.html { render :new }
        format.json { render json: @vehicle_fuel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicle_fuels/1
  # PATCH/PUT /vehicle_fuels/1.json
  def update
    respond_to do |format|
      if @vehicle_fuel.update(vehicle_fuel_params)
        format.html { redirect_to @vehicle_fuel, notice: 'Vehicle fuel was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle_fuel }
      else
        format.html { render :edit }
        format.json { render json: @vehicle_fuel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicle_fuels/1
  # DELETE /vehicle_fuels/1.json
  def destroy
    @vehicle_fuel.destroy
    respond_to do |format|
      format.html { redirect_to vehicle_fuels_url, notice: 'Vehicle fuel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle_fuel
      @vehicle_fuel = VehicleFuel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_fuel_params
      params.require(:vehicle_fuel).permit(:name)
    end
end
