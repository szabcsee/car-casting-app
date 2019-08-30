class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]

  # GET /vehicles
  # GET /vehicles.json
  def index
    @vehicles = Vehicle.all
  end

  # GET /vehicles/1
  # GET /vehicles/1.json
  def show
  end


  # GET /my-vehicles/1
  # GET /my-vehicles/1.json
  def find_by_user
    if current_user.admin
      @vehicles = Vehicle.find_by_user_id(params[:id])
    else
      @vehicles = Vehicle.find_by_user_id(current_user.id)
    end

    if @vehicles
      respond_to do |format|
        format.html {render :index}
        format.json {render json: @vehicles}
      end
    else
      respond_to do |format|
        format.html {redirect_to vehicles_url, notice: 'Could not find any vehicles.'}
        format.json {head :no_content}
      end
    end
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
    @vehicleTypes = VehicleType.all
    @vehicleConditions = VehicleCondition.all
    @vehicleBrands = fetch_brands(@vehicleTypes)
    @vehicleCategories = fetch_categories(@vehicleTypes)
    @vehicleBodies = fetch_bodies(@vehicleTypes)
    @vehicleFuels = VehicleFuel.all
    if current_user.admin
      @users = User.all
    end

  end

  # GET /vehicles/1/edit
  def edit
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    @vehicle = Vehicle.new(vehicle_params)

    respond_to do |format|
      if @vehicle.save
        format.html {redirect_to @vehicle, notice: 'Vehicle was successfully created.'}
        format.json {render :show, status: :created, location: @vehicle}
      else
        format.html {render :new}
        format.json {render json: @vehicle.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /vehicles/1
  # PATCH/PUT /vehicles/1.json
  def update

    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html {redirect_to @vehicle, notice: 'Vehicle was successfully updated.'}
        format.json {render :show, status: :ok, location: @vehicle}
      else
        format.html {render :edit}
        format.json {render json: @vehicle.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    @vehicle.destroy
    respond_to do |format|
      format.html {redirect_to vehicles_url, notice: 'Vehicle was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Return vehicle brands
  def fetch_brands(vehicle_types)
    groupedBrands = VehicleBrand.all
    vehicleBrands = {}
    vehicleTypes = []
    vehicle_types.each do |vehicleType|
      vehicleTypes[vehicleType[:id]] = vehicleType.slugified_name
      vehicleBrands[vehicleType.slugified_name] = []
    end

    groupedBrands.each do |batch|
      type = vehicleTypes[batch.vehicle_type_id]
      vehicleBrands[type].push batch
    end
    return vehicleBrands
  end

  def fetch_categories(vehicle_types)
    categories = VehicleCategory.all
    if categories.empty?
      return nil
    end
    vehicleCategories = {}
    vehicleTypes = []
    vehicle_types.each do |vehicleType|
      vehicleTypes[vehicleType[:id]] = vehicleType.slugified_name
      vehicleCategories[vehicleType.slugified_name] = []
    end

    categories.each do |category|
      type = vehicleTypes[category.vehicle_type_id]
      vehicleCategories[type].push category
    end
    return vehicleCategories

  end

  # Return vehicle bodies
  def fetch_bodies(vehicle_types)
    bodies = VehicleBody.all
    vehicleBodies = {}
    vehicleTypes = []
    vehicle_types.each do |vehicleType|
      vehicleTypes[vehicleType[:id]] = vehicleType.slugified_name
      vehicleBodies[vehicleType.slugified_name] = []
    end

    bodies.each do |body|
      type = vehicleTypes[body.vehicle_type_id]
      vehicleBodies[type].push body
    end
    return vehicleBodies
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def vehicle_params
    params.require(:vehicle).permit(:name, :vehicle_type_id, :vehicle_brand_id, :vehicle_category_id, :vehicle_model_id, :year, :vehicle_body_id, :meter, :vehicle_fuel_id, :vehicle_condition_id, :doors, :seats, :extras, :user_id)
  end
end
