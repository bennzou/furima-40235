class OrderForm
    include ActiveModel::Model
    attr_accessor :user_id, :item_id, :post_code, :item_prefecture_id, :city, :block, :building, :phone_number, :token

    with_options presence: true do
        validates :user_id
        validates :item_id

        validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
        validates :item_prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
        validates :city
        validates :block
        validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
        validates :token
    end

    def save
        order = Order.create(user_id: user_id, item_id: item_id)
        Address.create(order_id: order.id, post_code: post_code, item_prefecture_id: item_prefecture_id, city: city, block: block, building: building, phone_number: phone_number)
    end
end