json.array!(@api_keys) do |api_key|
  json.extract! api_key, :name, :key, :requests_count
  json.url api_key_url(api_key, format: :json)
end
