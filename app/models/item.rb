class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image

  belongs_to :category
  belongs_to :prefecture
  belongs_to :item_status
  belongs_to :shipping_cost
  belongs_to :shipping_date

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_info
    validates :item_category_id
    validates :item_shipping_fee_status_id
    validates :item_sales_status_id
    validates :item_prefecture_id
    validates :item_scheduled_delivery_id
    validates :item_price

    validates :item_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options numericality: { other_than: 0 } do
    validates :item_category_id
    validates :item_prefecture_id
    validates :item_sales_status_id
    validates :item_scheduled_delivery_id
    validates :item_shipping_fee_status_id
  end
end
