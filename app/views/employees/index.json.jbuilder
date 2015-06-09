json.array!(@employees) do |employee|
  json.extract! employee, :id, :name, :location, :sector
  json.url employee_url(employee, format: :json)
end
