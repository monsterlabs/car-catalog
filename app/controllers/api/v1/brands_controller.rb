class Api::V1::BrandsController < ApplicationController
  def index
    @brands = Brand.all
    respond_to do |format|
      format.json { render json: @brands }
    end
  end

  def show
    @brand = Brand.find(params[:id])
    respond_to do |format|
      format.json { render json: @brand }
    end
  end
end
