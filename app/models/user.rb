class User < ActiveRecord::Base
  has_and_belongs_to_many :venues
  before_create :ensure_authentication_token
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable,
  #       :token_authenticatable, :lockable, :omniauthable, :omniauth_providers=>[:twitter]
  devise :database_authenticatable, :registerable,
         :rememberable, :token_authenticatable, :omniauthable, :omniauth_providers=>[:twitter]
  
  #TwitterのOAutから供給される情報を元にアカウントを作成する
  #Twitterはemailを公開していないので、アカウント名をemailに突っ込んでおく
  def self.find_or_create_by_twitter(auth)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(  provider:auth.provider,
                           uid:auth.uid,
                           name:auth.info.name,
                           email:"@#{auth.info.nickname}",
                           password:Devise.friendly_token[0,20])
    end
    return user
  end

end

