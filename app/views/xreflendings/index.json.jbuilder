json.array!(@xreflendings) do |xreflending|
  json.extract! xreflending, :id, :equipment_id, :employee_id, :lend_date, :return_date
  json.url xreflending_url(xreflending, format: :json)
end
