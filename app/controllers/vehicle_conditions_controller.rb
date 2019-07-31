class VehicleConditionsController < ApplicationController
  before_action :set_vehicle_condition, only: [:show, :edit, :update, :destroy]

  # GET /vehicle_conditions
  # GET /vehicle_conditions.json
  def index
    @vehicle_conditions = VehicleCondition.all
  end

  # GET /vehicle_conditions/1
  # GET /vehicle_conditions/1.json
  def show
  end

  # GET /vehicle_conditions/new
  def new
    @vehicle_condition = VehicleCondition.new
  end

  # GET /vehicle_conditions/1/edit
  def edit
  end

  # POST /vehicle_conditions
  # POST /vehicle_conditions.json
  def create
    @vehicle_condition = VehicleCondition.new(vehicle_condition_params)

    respond_to do |format|
      if @vehicle_condition.save
        format.html { redirect_to @vehicle_condition, notice: 'Vehicle condition was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle_condition }
      else
        format.html { render :new }
        format.json { render json: @vehicle_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicle_conditions/1
  # PATCH/PUT /vehicle_conditions/1.json
  def update
    respond_to do |format|
      if @vehicle_condition.update(vehicle_condition_params)
        format.html { redirect_to @vehicle_condition, notice: 'Vehicle condition was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle_condition }
      else
        format.html { render :edit }
        format.json { render json: @vehicle_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicle_conditions/1
  # DELETE /vehicle_conditions/1.json
  def destroy
    @vehicle_condition.destroy
    respond_to do |format|
      format.html { redirect_to vehicle_conditions_url, notice: 'Vehicle condition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle_condition
      @vehicle_condition = VehicleCondition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_condition_params
      params.require(:vehicle_condition).permit(:name)
    end
end
