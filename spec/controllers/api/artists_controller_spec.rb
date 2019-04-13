require 'rails_helper'

NEW_ARTIST = {name: "Nujabes", age: "31"}
def createArtist
  Artist.create(NEW_ARTIST)
end
describe Api::ArtistsController do
  before do
    Artist.delete_all
  end
  describe 'GET index' do
    it 'returns http status ok' do
      get :index
      expect(response).to have_http_status(:ok)
    end
    it 'returns http status ok when get one movie data' do
      artist = createArtist
      get :index, params: {id: artist.id}
      expect(response).to have_http_status(:ok)
    end
    it 'render json with all artists' do
      createArtist
      get :index
      artists = JSON.parse(response.body)
      expect(artists.size).to eq 1
    end
  end
  describe 'GET show' do
    it 'returns http status ok' do
      artist = createArtist
      get :show, params: { id: artist.id }
      expect(response).to have_http_status(:ok)
    end
    it 'render the correct user' do
      artist = createArtist
      get :show, params: { id: artist.id }
      expected_artist = JSON.parse(response.body)
      expect(expected_artist["id"]).to eq(artist.id)
    end
    it 'returns http status not found' do
      get :show, params: { id: 'x'}
      expect(response).to have_http_status(:not_found)
    end
  end

end