json.extract! supportticket, :id, :title, :description, :status, :open_date, :closed_date, :user_id, :created_at, :updated_at
json.url supportticket_url(supportticket, format: :json)
