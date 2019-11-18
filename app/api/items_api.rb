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
      requires :id, type: Integer, desc: 'Item id'
    end
    route_param :id do
      get do
        item = Item.find(params[:id])
        serialize(item, serializer: Api::ItemSerializer)
      end
    end
  end
end
