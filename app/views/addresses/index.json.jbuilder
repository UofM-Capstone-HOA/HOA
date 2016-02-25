json.array!(@addresses) do |address|
  json.extract! address, :id, :number, :street, :city, :state, :homeOwner_id
  json.url address_url(address, format: :json)
end
