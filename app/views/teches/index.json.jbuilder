json.array!(@teches) do |tech|
  json.extract! tech, :tech_name
  json.url tech_url(tech, format: :json)
end