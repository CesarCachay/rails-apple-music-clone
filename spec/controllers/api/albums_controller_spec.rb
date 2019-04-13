require 'rails_helper'

RSpec.describe Api::AlbumsController, type: :controller do
  
  before do
    @artist_1 = Artist.create(
      name: "Artist 1",
      age: 12
    )
    @album = Album.create(
      title: "Title - 1",
      rating: 2
    )
  end

  # List of albums
  describe 'GET index' do
    it 'returns http status ok' do
      get :index
      expect(response).to have_http_status(:ok)
    end
    it 'render json with all albums' do
      get :index
      albums = JSON.parse(response.body)
      expect(albums.size).to eq 1
    end
    it 'returns http status ok when get one album data' do
      get :index, params: {id: @album.id}
      expect(response).to have_http_status(:ok)
    end
  end

  # Album's detail
  describe 'GET show' do
    it 'returns http status ok' do
      get :show, params: { id: @album }
      expect(response).to have_http_status(:ok)
    end
    it 'render the correct album' do
      get :show, params: { id: @album }
      expected_album = JSON.parse(response.body)
      expect(expected_album["id"]).to eq(@album.id)
    end
    it 'returns http status not found' do
      get :show, params: { id: 'xxx' }
      expect(response).to have_http_status(:not_found)
    end
  end

end