class ItemsSearchService
  attr_accessor :price_from, :price_to, :title

  def initialize(search_params)
    @price_from = search_params[:price_from]
    @price_to = search_params[:price_to]
    @title = search_params[:title]
  end

  def perform
    items = Item
    items = items.where('price >= ?', @price_from) if @price_from.present?
    items = items.where('price <= ?', @price_to) if @price_to.present?
    items = items.where("title LIKE '%#{@title}%'") if @title.present?
    items.all
  end
end
