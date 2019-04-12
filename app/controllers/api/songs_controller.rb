class Api::SongsController < ApplicationController

  def index
    render json: Song.all
  end

  def show 
    render json: Song.find(params[:id]), status: :ok
  end

  def artists
    render json: Song.find(params[:song_id]).artists
  end

  def albums
    render json: Song.find(params[:song_id]).albums
  end

end
  