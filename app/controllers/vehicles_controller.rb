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
    @vehicleExtras = fetch_extras(@vehicleTypes)
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
    @vehicle = Vehicle.new
    unless authorize_user(vehicle_params[:user_id])
      @vehicle.errors.push({type: 'Authorization', message: 'You are not supposed to edit this.'})
    end

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

  def fetch_entities(vehicle_types, groupedEntities)
    entities = {}
    vehicleTypes = []
    vehicle_types.each do |vehicleType|
      vehicleTypes[vehicleType[:id]] = vehicleType.slugified_name
      entities[vehicleType.slugified_name] = []
    end

    groupedEntities.each do |batch|
      type = vehicleTypes[batch.vehicle_type_id]
      entities[type].push batch
    end
    return entities
  end

  # Return vehicle brands
  def fetch_brands(vehicle_types)
    groupedBrands = VehicleBrand.all
    return fetch_entities(vehicle_types, groupedBrands)
  end

  # Return vehicle categories
  def fetch_categories(vehicle_types)
    categories = VehicleCategory.all
    if categories.empty?
      return nil
    end
    return fetch_entities(vehicle_types, categories)
  end

  # Return vehicle bodies
  def fetch_bodies(vehicle_types)
    bodies = VehicleBody.all
    return fetch_entities(vehicle_types, bodies)
  end

  # Return extras
  def fetch_extras(vehicle_types)
    extras = VehicleExtra.all
    return fetch_entities(vehicle_types, extras)
  end

  def authorize_user(user_id)
    current_user.admin || current_user.id == user_id
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
