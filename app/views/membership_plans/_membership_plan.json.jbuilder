json.extract! membership_plan, :id, :name, :description, :price, :duration_months, :features, :status, :created_at, :updated_at
json.url membership_plan_url(membership_plan, format: :json)
