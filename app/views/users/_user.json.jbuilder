json.extract! user, :id, :username, :password, :email, :birthday, :bio, :created_at, :updated_at
json.url user_url(user, format: :json)
