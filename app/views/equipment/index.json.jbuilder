json.array!(@equipment) do |equipment|
  json.extract! equipment, :id, :serial_number, :name, :description, :employee_id, :equipment_type_id
  json.url equipment_url(equipment, format: :json)
end
