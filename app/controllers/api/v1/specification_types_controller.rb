class Api::V1::SpecificationTypesController < ApplicationController
  def index
    @specification_types = SpecificationType.all
    respond_to do |format|
      format.json { render json: @specification_types }
    end
  end

  def show
    @specification_type = SpecificationType.find(params[:id])
    respond_to do |format|
      format.json { render json: @specification_type }
    end
  end
end
