class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  has_one :order
  has_one_attached :image

  belongs_to :item_category
  belongs_to :item_prefecture
  belongs_to :item_sales_status
  belongs_to :item_shipping_fee_status
  belongs_to :item_scheduled_delivery

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_info
    validates :item_category_id
    validates :item_shipping_fee_status_id

    validates :item_price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "must be an integer" }
  end

  with_options numericality: { other_than: 0} do
    validates :item_category_id
    validates :item_prefecture_id
    validates :item_sales_status_id
    validates :item_scheduled_delivery_id
    validates :item_shipping_fee_status_id
  end
end
