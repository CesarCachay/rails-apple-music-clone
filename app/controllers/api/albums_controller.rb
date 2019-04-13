class Api::AlbumsController < ApplicationController

  def index
    render json: Album.all
  end

  def show
    render json: Album.find(params[:id])
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { message: e.message }, status: :not_found
  end

end
