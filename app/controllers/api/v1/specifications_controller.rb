class Api::V1::SpecificationsController < ApplicationController
  def index
    @specifications = Specification.all
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
