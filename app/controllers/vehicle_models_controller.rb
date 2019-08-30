class VehicleModelsController < ApplicationController
  before_action :set_vehicle_model, only: [:show, :edit, :update, :destroy]

  # GET /vehicle_models
  # GET /vehicle_models.json
  def index
    @vehicle_models = VehicleModel.all
  end

  # GET /vehicle_models/1
  # GET /vehicle_models/1.json
  def show
    @vehicle_brand = VehicleBrand.find @vehicle_brand.vehicle_brand_id
  end

  # GET /vehicle_models/new
  def new
    @vehicle_model = VehicleModel.new
    @vehicle_brands = VehicleBrand.all
  end

  # GET /vehicle_models/1/edit
  def edit
    @vehicle_brands = VehicleBrand.all
  end

  # POST /vehicle_models
  # POST /vehicle_models.json
  def create
    @vehicle_model = VehicleModel.new(vehicle_model_params)
    respond_to do |format|
      if @vehicle_model.save
        format.html { redirect_to @vehicle_model, notice: 'Vehicle model was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle_model }
      else
        format.html { render :new }
        format.json { render json: @vehicle_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicle_models/1
  # PATCH/PUT /vehicle_models/1.json
  def update
    respond_to do |format|
      if @vehicle_model.update(vehicle_model_params)
        format.html { redirect_to @vehicle_model, notice: 'Vehicle model was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle_model }
      else
        format.html { render :edit }
        format.json { render json: @vehicle_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicle_models/1
  # DELETE /vehicle_models/1.json
  def destroy
    @vehicle_model.destroy
    respond_to do |format|
      format.html { redirect_to vehicle_models_url, notice: 'Vehicle model was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def find_by_brand
    @vehicle_brand = VehicleBrand.find_by(name: params[:vehicle_brand_id], vehicle_type_id: params[:vehicle_type_id])
    @models_arr = {}
    @models_arr[:model_data] = []
    @models_arr[:vehicle_type_id] =  params[:vehicle_type_id]
    @models_arr[:vehicle_brand_id] = @vehicle_brand.id
    if !@vehicle_brand.nil?
      @vehicle_models = VehicleModel.where(vehicle_brand_id: @vehicle_brand.id)
      @vehicle_models.each do |model|
        @models_arr[:model_data].push(id: model.id, name: model.name)
      end
    end

    respond_to do |format|
      format.json { render json: @models_arr.as_json, status: :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle_model
      @vehicle_model = VehicleModel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_model_params
      params.require(:vehicle_model).permit(:name, :vehicle_brand_id)
    end
end
