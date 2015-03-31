json.array!(@api_keys) do |api_key|
  json.extract! api_key, :id, :name, :key, :requests_count, :last_request_ip, :last_reset_at, :user
  json.url api_key_url(api_key, format: :json)
end
