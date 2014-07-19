json.array!(@asso_techs) do |asso_tech|
  json.extract! asso_tech, :tech_id, :peer_id
  json.url asso_tech_url(asso_tech, format: :json)
end