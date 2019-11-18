module Api
  class ItemSerializer < ApplicationSerializer
    attributes :id, :title, :image
    attribute :description, unless: :index?

    def image
      object.image.search.url
    end

    def index?
      instance_options[:index]
    end
  end
end
