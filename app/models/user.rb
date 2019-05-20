class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google, :facebook]

  has_one :profile, dependent: :destroy
  has_one :address, dependent: :destroy
  has_one :card_info, dependent: :destroy
  has_one :user_info, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :transactions, dependent: :destroy
  accepts_nested_attributes_for :address, update_only: true
  accepts_nested_attributes_for :card_info, update_only: true

  validates :nickname, presence: true
  validates :last_name, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: "" }, presence: true
  validates :first_name, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: "" }, presence: true
  validates :last_name_kana, format: { with: /\A[ァ-ンー－]+\Z/ }, presence: true
  validates :first_name_kana, format: { with: /\A[ァ-ンー－]+\Z/ }, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  protected
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.nickname = auth.info.name
      user.first_name = "太郎"
      user.last_name = "メルカリ"
      user.first_name_kana = "タロウ"
      user.last_name_kana = "メルカリ"
      user.birth_date = "1900-01-01"
      user.profile_id = "1"
      user.card_info_id = "1"
      user.user_info_id = "1"
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end
