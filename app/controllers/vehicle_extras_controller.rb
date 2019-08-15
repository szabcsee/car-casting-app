class VehicleExtrasController < ApplicationController
  before_action :set_vehicle_extra, only: [:show, :edit, :update, :destroy]

  # GET /vehicle_extras
  # GET /vehicle_extras.json
  def index
    @vehicle_extras = VehicleExtra.all
  end

  # GET /vehicle_extras/1
  # GET /vehicle_extras/1.json
  def show
    @vehicle_type = VehicleType.find @vehicle_extra.vehicle_type_id
  end

  # GET /vehicle_extras/new
  def new
    @vehicle_types = VehicleType.all
    @vehicle_extra = VehicleExtra.new
  end

  # GET /vehicle_extras/1/edit
  def edit
    @vehicle_types = VehicleType.all
  end

  # POST /vehicle_extras
  # POST /vehicle_extras.json
  def create
    @vehicle_extra = VehicleExtra.new(vehicle_extra_params)

    respond_to do |format|
      if @vehicle_extra.save
        format.html { redirect_to @vehicle_extra, notice: 'Vehicle extra was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle_extra }
      else
        format.html { render :new }
        format.json { render json: @vehicle_extra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicle_extras/1
  # PATCH/PUT /vehicle_extras/1.json
  def update
    respond_to do |format|
      if @vehicle_extra.update(vehicle_extra_params)
        format.html { redirect_to @vehicle_extra, notice: 'Vehicle extra was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle_extra }
      else
        format.html { render :edit }
        format.json { render json: @vehicle_extra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicle_extras/1
  # DELETE /vehicle_extras/1.json
  def destroy
    @vehicle_extra.destroy
    respond_to do |format|
      format.html { redirect_to vehicle_extras_url, notice: 'Vehicle extra was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle_extra
      @vehicle_extra = VehicleExtra.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_extra_params
      params.require(:vehicle_extra).permit(:name, :vehicle_type_id)
    end
end
