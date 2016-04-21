json.array!(@users) do |user|
  json.extract! user, :id, :email, :password, :lastname, :firstname, :phonenumber, :gender, :addressline1, :city, :state, :type
  json.url user_url(user, format: :json)
end
