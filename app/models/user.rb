class User < ApplicationRecord
  # emailのバリデーション
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:twitter, :google_oauth2]

  has_many :sns_credentials, dependent: :destroy
  has_many :itineraries, dependent: :destroy
  has_many :marks, dependent: :destroy

  validates :name, length: { minimum: 1, maximum: 10 }
  validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX }}

  attachment :profile_image


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
