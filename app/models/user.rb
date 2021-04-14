class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:twitter, :google_oauth2]

  attachment :profile_image

  has_many :sns_credentials, dependent: :destroy
  has_many :itineraries, dependent: :destroy

  def self.guest
    find_or_create_by!(name: "ゲストさん", email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end



  # SNS認証（登録済みuserかどうか）
  def self.from_omniauth(auth)
  sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create

  user = sns.user || User.where(email: auth.info.email).first_or_initialize(
    name: auth.info.name,
    email: auth.info.email
  )
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
