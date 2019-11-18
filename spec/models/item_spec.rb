require 'spec_helper'

describe Item do
  let(:item) { build(:item) }

  it 'must be valid' do
    expect(item).to be_valid
  end

  describe 'validations' do
    context '#image' do
      it { should validate_presence_of(:image) }
    end

    context '#title' do
      it { should validate_presence_of(:title) }
    end

    context '#description' do
      it { should validate_presence_of(:description) }
    end

    context '#price' do
      it { should validate_presence_of(:price) }
      it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
    end
  end
end
