class Api::V1::FeaturesController < ApplicationController
  def index
    q = (params.has_key? :specification_id) ? { specification_id: params[:specification_id] } : {}
    @features = Feature.where(q).all
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
