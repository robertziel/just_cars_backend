require 'spec_helper'

describe Api::ItemSerializer do
  let(:item) { create :item }

  describe '#as_json' do
    context 'index set false' do
      subject do
        serialize(item, serializer: described_class)
      end

      it 'serializes item' do
        expect(subject).to match(
          id: item.id,
          title: item.title,
          image: item.image.search.url,
          description: item.description
        )
      end
    end

    context 'index set true' do
      subject do
        serialize(item, serializer: described_class, index: true)
      end

      it 'serializes item' do
        expect(subject).to match(
          id: item.id,
          title: item.title,
          image: item.image.search.url
        )
      end
    end
  end
end
