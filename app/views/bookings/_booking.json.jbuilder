json.extract! booking, :id, :route_id, :user_id, :status, :booked_at, :created_at, :updated_at
json.url booking_url(booking, format: :json)
