FactoryBot.define do
  factory :item do
    price { 1 }
    title { 'Title' }
    description { 'Description' }
    image do
      Rack::Test::UploadedFile.new(
        File.join(Rails.root, 'spec', 'support', 'images', 'test.jpg')
      )
    end
  end
end
