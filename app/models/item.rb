class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :situation
  belongs_to_active_hash :charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_date

  validates :item_name, :item_content, :price, :image, presence: true
  validates :category_id, numericality: { other_than: 1, message: 'Please select' }
  validates :situation_id, numericality: { other_than: 1, message: 'Please select' }
  validates :charge_id, numericality: { other_than: 1, message: 'Please select' }
  validates :prefecture_id, numericality: { other_than: 1, message: 'Please select' }
  validates :shipping_date_id, numericality: { other_than: 1, message: 'Please select' }
  validates :price, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999,
    message: 'Please enter a valid price between 300 and 9,999,999'
  }
  belongs_to :user
  has_one :purchase
  has_one_attached :image
end
