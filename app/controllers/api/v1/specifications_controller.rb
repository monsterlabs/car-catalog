class Api::V1::SpecificationsController < ApplicationController
  def index
    q = (params.has_key? :car_id) ? { car_id: params[:car_id] } : {}
    @specifications = Specification.where(q).all
    respond_to do |format|
      format.json { render json: @specifications, :root => "specifications" }
    end
  end

  def show
    @specification = Specification.find(params[:id])
    respond_to do |format|
      format.json { render json: @specification_type , :root => "specification" }
    end
  end
end
