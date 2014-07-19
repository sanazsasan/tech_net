json.array!(@rates) do |rate|
  json.extract! rate, :reter_id, :reted_id, :score
  json.url rate_url(rate, format: :json)
end