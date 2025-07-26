json.extract! membership_history, :id, :member_id, :membership_plan_id, :start_date, :end_date, :status, :payment_amount, :created_at, :updated_at
json.url membership_history_url(membership_history, format: :json)
