json.array!(@listings) do |listing|
  json.extract! listing, :id, :name, :price, :description, :image
  json.url listing_url(listing, format: :json)
end
