class Api::V1::ComparedFeaturesController < ApplicationController
  def index
    q = (params.has_key? :comparative_id) ? { comparative_id: params[:comparative_id] } : {}
    @features = ComparedFeature.where(q).all
    respond_to do |format|
      format.json { render json: @features, root: 'comparedfeatures' }
    end
  end

  def show
    @feature = ComparedFeature.find(params[:id])
    respond_to do |format|
      format.json { render json: @feature, root: 'comparedfeature' }
    end
  end
end
