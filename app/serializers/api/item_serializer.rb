module Api
  class ItemSerializer < ApplicationSerializer
    attributes :id, :image, :price, :title
    attribute :description, unless: :index?

    def image
      {
        full: object.image.full.url,
        search: object.image.search.url
      }
    end

    def index?
      instance_options[:index]
    end

    def price
      "#{object.price} $"
    end
  end
end
