class ItemsApi < Grape::API
  resource :items do
    desc 'Index'
    get do
      items = Item.all
      {
        items: serialize_collection(items, serializer: Api::ItemSerializer, index: true)
      }
    end

    desc 'Show'
    params do
      requires :id, type: Integer
    end
    route_param :id do
      get do
        item = Item.find(params[:id])
        serialize(item, serializer: Api::ItemSerializer)
      end
    end

    desc 'Create'
    params do
      requires :description, type: String
      requires :image, type: Rack::Multipart::UploadedFile
      requires :price, type: BigDecimal
      requires :title, type: String
    end
    post do
      item = Item.new(params)
      if item.save
        status 200
        serialize(item, serializer: Api::ItemSerializer)
      else
        response_json = { error_messages: item.errors.messages }
        error!(response_json, 401)
      end
    end
  end
end
