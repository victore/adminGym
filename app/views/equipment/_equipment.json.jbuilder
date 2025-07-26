json.extract! equipment, :id, :name, :description, :category, :serial_number, :purchase_date, :maintenance_date, :status, :gym_id, :created_at, :updated_at
json.url equipment_url(equipment, format: :json)
