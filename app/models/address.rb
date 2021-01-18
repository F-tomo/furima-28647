class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :order

  with_options presence: true, numericality: { other_than: 1 } do
    validates :prefecture_id
  end

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :house_number
    validates :phone, format: { with: /\A[0-9]+\z/ }
    validates :order_id
  end
end
