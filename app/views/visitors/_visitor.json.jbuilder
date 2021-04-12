json.extract! visitor, :id, :checked_in, :name, :phone_number, :reason_of_visit, :created_at, :updated_at
json.url visitor_url(visitor, format: :json)
