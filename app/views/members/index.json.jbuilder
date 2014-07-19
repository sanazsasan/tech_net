json.array!(@members) do |member|
  json.extract! member, :username, :name, :lastname, :email, :password, :experiences
  json.url member_url(member, format: :json)
end