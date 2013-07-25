class Api::V1::LinesController < ApplicationController
  def index
    @lines = Line.all
    respond_to do |format|
      format.json { render json: @lines }
    end
  end

  def show
    @line = Line.find(params[:id])
    respond_to do |format|
      format.json { render json: @line }
    end
  end
end
