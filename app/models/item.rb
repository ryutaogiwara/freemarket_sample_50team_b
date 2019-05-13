class Item < ApplicationRecord
  has_many :transactions, dependent: :destroy
  has_many :images, dependent: :destroy
  belongs_to :user
end
