require 'spec_helper'

describe ItemsApi do
  let!(:item) { create(:item) }

  describe '#INDEX' do
    subject do
      get '/api/items'
    end

    it 'must get index' do
      subject

      expect(response.status).to eq 200

      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:items]).to eq serialize_collection([item], serializer: Api::ItemSerializer, index: true)
    end
  end

  describe '#SHOW' do
    subject do
      get "/api/items/#{item.id}"
    end

    it 'must show item' do
      subject

      expect(response.status).to eq 200

      json = JSON.parse(response.body, symbolize_names: true)
      expect(json).to eq serialize(item, serializer: Api::ItemSerializer)
    end
  end
end
