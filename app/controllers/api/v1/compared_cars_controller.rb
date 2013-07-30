class Api::V1::ComparedCarsController < ApplicationController
  def index
    @cars = ComparedCar.all
    respond_to do |format|
      format.json { render json: @cars, root: 'comparedcars' }
    end
  end

  def show
    @car = ComparedCar.find(params[:id])
    respond_to do |format|
      format.json { render json: @car, root: 'comparedcar' }
    end
  end
end
