class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google, :facebook]

  has_one :profile, dependent: :destroy
  has_one :address, dependent: :destroy
  has_one :card_info, dependent: :destroy
  has_one :user_info, dependent: :destroy
  has_many :items
  has_many :transactions, dependent: :destroy
  accepts_nested_attributes_for :address, update_only: true
  accepts_nested_attributes_for :card_info, update_only: true

  validates :nickname, presence: true
  validates :last_name, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: "" }, presence: true
  validates :first_name, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: "" }, presence: true
  validates :last_name_kana, format: { with: /\A[ァ-ンー－]+\Z/ }, presence: true
  validates :first_name_kana, format: { with: /\A[ァ-ンー－]+\Z/ }, presence: true
  VALID_EMAIL_REGEX = /^([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+$/i.freeze
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX, multiline: true }

  protected

  def self.find_omniauth(auth)
    User.where(provider: auth.provider, uid: auth.uid).first
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.google_data"] && session["devise.google_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
      if data = session["devise.google_data"]
        user.provider = data["provider"] if user.provider.blank?
        user.uid = data["uid"] if user.uid.blank?
        user.password = Devise.friendly_token[0,20] if user.password.blank?
      end
     if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
      if data = session["devise.facebook_data"]
        user.provider = data["provider"] if user.provider.blank?
        user.uid = data["uid"] if user.uid.blank?
        user.password = Devise.friendly_token[0,20] if user.password.blank?
      end
    end
  end
end
