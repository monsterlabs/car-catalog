class Api::V1::ComparativesController < ApplicationController
  def index
    q = (params.has_key? :specification_id) ? { specification_id: params[:specification_id] } : {}
    @comparatives = Comparative.where(q).all
    respond_to do |format|
      format.json { render json: @comparatives, :root => "comparatives", :except => [:compared_features] }
    end
  end

  def show
    @comparative = Comparative.find(params[:id])
    respond_to do |format|
      format.json { render json: @comparative , :root => "comparative" }
    end
  end
end
