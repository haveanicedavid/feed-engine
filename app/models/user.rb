class User < ActiveRecord::Base
  has_many :searches
  has_many :analyses

  def self.find_or_create_from_auth(auth)
    user = find_or_create_by(
    provider: auth.provider,
    uid:  auth.uid
    )

    user.nickname  = auth.info.nickname
    user.name      = auth.info.name
    user.location  = auth.info.location
    user.image_url = auth.info.image
    user.token     = auth.credentials.token
    user.save!

    user
  end

  def self.email?
    if self.email.empty?
      false
    else
      true
    end
  end
end
