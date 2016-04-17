json.array!(@home_owners) do |home_owner|
  json.extract! home_owner, :id, :firstName, :lastName, :email, :phone
  json.url home_owner_url(home_owner, format: :json)
end
