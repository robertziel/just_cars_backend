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

  describe '#CREATE' do
    let(:item_attributes) { attributes_for(:item).merge(blue: 'aaa') }

    subject do
      post '/api/items', params: item_attributes
    end

    context 'succeeded' do
      it 'should be success' do
        subject
        expect(response.status).to eq 200
      end

      it 'should add new item' do
        expect { subject }.to change { Item.count }.by(1)
      end
    end

    context 'did not succeeded' do
      before do
        item_attributes[:title] = nil
      end

      it 'should be unauthorized' do
        subject
        expect(response.status).to eq 401
      end

      it 'should return error message' do
        subject
        json = JSON.parse(response.body, symbolize_names: true)
        expect(json[:error_messages]).not_to be_nil
      end
    end
  end
end
