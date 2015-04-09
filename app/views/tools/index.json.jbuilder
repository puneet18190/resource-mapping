json.array!(@tools) do |tool|
  json.extract! tool, :id, :title, :description, :url
  json.url tool_url(tool, format: :json)
end
