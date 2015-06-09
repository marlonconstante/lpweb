json.array!(@equipment) do |equipment|
  json.extract! equipment, :id, :code, :type, :employee, :description
  json.url equipment_url(equipment, format: :json)
end
