json.extract! route, :id, :origin, :destination, :distance, :duration, :user_id, :created_at, :updated_at
json.url route_url(route, format: :json)
