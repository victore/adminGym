json.extract! attendance, :id, :member_id, :gym_id, :check_in, :check_out, :created_at, :updated_at
json.url attendance_url(attendance, format: :json)
