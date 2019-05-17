class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  has_one :address, dependent: :destroy
  has_one :card_info, dependent: :destroy
  has_one :user_info, dependent: :destroy
  has_many :items
  has_many :transactions, dependent: :destroy
end
