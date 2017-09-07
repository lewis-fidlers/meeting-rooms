class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

  has_many :meetings

  def to_s
    name
  end

  def self.find_for_google_oauth2(access_token)
    data = access_token.info
    user = User.find_by(email: data.email)
    if user
      user.provider = access_token.provider
      user.uid = access_token.uid
      user.token = access_token.credentials.token
      user.save
      user
    else
      User.create(email: data.email, name: data.name, provider: access_token.provider, uid: access_token.uid, token: access_token.credentials.token)
    end
  end
end
