class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :transactions, dependent: :destroy
  has_many :images, dependent: :delete_all
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :user
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :parentcategory
  belongs_to :category

  validates :name, length: { maximum: 40 }, presence: true
  validates :description, length: { maximum: 1000 }, presence: true
  validates :state, presence: true
  validates :postage, presence: true
  validates :region, presence: true
  validates :shipping, presence: true
  validates :shipping_date, presence: true
  validates :price, numericality: { only_integer: true , greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, presence: true
  validates :category_id, presence: true
  validates :size, presence: true
  validates :images, presence: true
end
