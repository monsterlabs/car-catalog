class Api::V1::SeriesController < ApplicationController
  def index
    @series = Serie.all
    respond_to do |format|
      format.json { render json: @series }
    end
  end

  def show
    @serie = Serie.find(params[:id])
    respond_to do |format|
      format.json { render json: @serie }
    end
  end
end
