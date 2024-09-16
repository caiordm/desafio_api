class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :email, :avatar_url

  def avatar_url
    object.avatar.url if object.avatar.present?
  end
end

