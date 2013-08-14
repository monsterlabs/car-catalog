class Api::V1::FeaturesController < ApplicationController
  def index
    @features = Feature.all
    respond_to do |format|
      format.json { render json: @features, root: 'features' }
    end
  end

  def show
    @feature = Feature.find(params[:id])
    respond_to do |format|
      format.json { render json: @feature, root: 'feature' }
    end
  end
end
