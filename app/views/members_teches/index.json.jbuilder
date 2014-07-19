json.array!(@members_teches) do |members_tech|
  json.extract! members_tech, :member_id, :tech_id, :integer
  json.url members_tech_url(members_tech, format: :json)
end