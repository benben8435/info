json.array!(@dinnings) do |dinning|
  json.extract! dinning, :id, :quantity, :price, :rate, :user_id
  json.url dinning_url(dinning, format: :json)
end
