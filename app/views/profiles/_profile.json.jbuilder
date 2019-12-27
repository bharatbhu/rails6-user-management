json.extract! profile, :id, :name, :profile_image, :contact
json.url profile_url(profile, format: :json)
