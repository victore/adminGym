json.extract! staff_schedule, :id, :staff_id, :gym_id, :day_of_week, :start_time, :end_time, :created_at, :updated_at
json.url staff_schedule_url(staff_schedule, format: :json)
