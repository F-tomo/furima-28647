class Address < ApplicationRecord
  belongs_to :prefecture
  belongs_to :order

  with_options presence: true, numericality: { other_than: 1 } do
    validates :prefecture_id
  end

  with_options presence: true,format: { with: /\A[0-9]+\z/ } do
    validates :post_code
    validates :phone
  end

  with_options presence: true do
    validates :city
    validates :house_number
  end
end
