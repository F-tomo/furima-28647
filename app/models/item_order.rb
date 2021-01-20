class ItemOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :house_number, :building, :phone, :token

  with_options presence: true, numericality: { other_than: 1 } do
    validates :prefecture_id
  end

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :house_number
    validates :phone, format: { with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, phone: phone, order_id: order.id)
  end
end
