class Item < ApplicationRecord
  has_many :transactions, dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, update_only: true
  belongs_to :user
end
