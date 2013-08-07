class Api::V1::ComparativesController < ApplicationController
  def index
    @comparatives = Comparative.all
    respond_to do |format|
      format.json { render json: @comparatives, :root => "comparatives" }
    end
  end

  def show
    @comparative = Comparative.find(params[:id])
    respond_to do |format|
      format.json { render json: @comparative_type , :root => "comparative" }
    end
  end
end
