json.extract! booking, :id, :member_id, :activity_id, :booking_date, :start_time, :end_time, :status, :created_at, :updated_at
json.url booking_url(booking, format: :json)
