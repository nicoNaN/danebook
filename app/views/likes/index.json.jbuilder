json.array!(@likes) do |like|
  json.extract! like, :id, :taggable_id, :taggable_type
  json.url like_url(like, format: :json)
end
