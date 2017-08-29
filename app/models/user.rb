class User < ApplicationRecord
  after_create :set_list
  before_create :set_username
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]
  has_one :list, dependent: :destroy

  def to_param
    username
  end

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

  def set_list
    self.list = List.create(description: "Hello world, this is your list. You get only one so treat it with care. Good luck!🚀")
  end

  def set_username
    words = ["the_great", "the_furriest", "the_conqueror", "the_sleepy", "the_laughable", "the_destroyer"]
    self.username = "#{self.first_name.downcase}_#{words.sample}"
  end
end
