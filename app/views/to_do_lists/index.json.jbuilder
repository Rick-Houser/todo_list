json.array!(@to_do_lists) do |to_do_list|
  json.extract! to_do_list, :id, :title, :description
  json.url to_do_list_url(to_do_list, format: :json)
end
