class Api::V1::CarlinesController < ApplicationController
  def index
    @carlines = CarLine.all
    respond_to do |format|
      format.json { render json: @carlines }
    end
  end

  def show
    @carline = CarLine.find(params[:id])
    respond_to do |format|
      format.json { render json: @carline }
    end
  end
end
