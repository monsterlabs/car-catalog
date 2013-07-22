class Api::V1::CarmodelsController < ApplicationController
  def index
    @carmodels = CarModel.all
    respond_to do |format|
      format.json { render json: @carmodels }
    end
  end

  def show
    @carmodels = CarModel.find(params[:id])
    respond_to do |format|
      format.json { render json: @carmodels }
    end
  end
end
