json.extract! member, :id, :user_id, :membership_plan_id, :gym_id, :membership_number, :join_date, :expiry_date, :status, :emergency_contact, :emergency_phone, :created_at, :updated_at
json.url member_url(member, format: :json)
