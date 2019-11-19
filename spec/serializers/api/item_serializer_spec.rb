require 'spec_helper'

describe Api::ItemSerializer do
  let(:item) { create :item }

  let(:image) do
    {
      full: item.image.full.url,
      search: item.image.search.url
    }
  end

  describe '#as_json' do
    context 'index set false' do
      subject do
        serialize(item, serializer: described_class)
      end

      it 'serializes item' do
        expect(subject).to match(
          description: item.description,
          id: item.id,
          image: image,
          price: "#{item.price} $",
          title: item.title
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
          image: image,
          price: "#{item.price} $",
          title: item.title
        )
      end
    end
  end
end
