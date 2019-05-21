class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :transactions, dependent: :destroy
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :user
  belongs_to_active_hash :prefecture
end
