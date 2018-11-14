json.extract! user, :id, :name, :surname, :email, :phone, :address, :city, :zipcode, :created_at, :updated_at
json.url user_url(user, format: :json)
