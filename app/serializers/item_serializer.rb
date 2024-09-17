class ItemSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :description, :user_id
end
