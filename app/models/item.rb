class Item < ApplicationRecord
  has_many :transactions, dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  belongs_to :user
end
