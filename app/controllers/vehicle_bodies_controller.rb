class VehicleBodiesController < ApplicationController
  before_action :set_vehicle_body, only: [:show, :edit, :update, :destroy]

  # GET /vehicle_bodies
  # GET /vehicle_bodies.json
  def index
    @vehicle_bodies = VehicleBody.all
  end

  # GET /vehicle_bodies/1
  # GET /vehicle_bodies/1.json
  def show
  end

  # GET /vehicle_bodies/new
  def new
    @vehicle_body = VehicleBody.new
  end

  # GET /vehicle_bodies/1/edit
  def edit
  end

  # POST /vehicle_bodies
  # POST /vehicle_bodies.json
  def create
    @vehicle_body = VehicleBody.new(vehicle_body_params)

    respond_to do |format|
      if @vehicle_body.save
        format.html { redirect_to @vehicle_body, notice: 'Vehicle body was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle_body }
      else
        format.html { render :new }
        format.json { render json: @vehicle_body.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicle_bodies/1
  # PATCH/PUT /vehicle_bodies/1.json
  def update
    respond_to do |format|
      if @vehicle_body.update(vehicle_body_params)
        format.html { redirect_to @vehicle_body, notice: 'Vehicle body was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle_body }
      else
        format.html { render :edit }
        format.json { render json: @vehicle_body.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicle_bodies/1
  # DELETE /vehicle_bodies/1.json
  def destroy
    @vehicle_body.destroy
    respond_to do |format|
      format.html { redirect_to vehicle_bodies_url, notice: 'Vehicle body was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle_body
      @vehicle_body = VehicleBody.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_body_params
      params.require(:vehicle_body).permit(:name)
    end
end
