json.array!(@members) do |member|
  json.extract! member, :id, :hhmemberin, :hhmembergen, :hhmemberage, :hhmemberrel, :hhmemberuasid, :entry_id
  json.url member_url(member, format: :json)
end
