class Item < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :discription
    validates :cotegory_id
    validates :condition_id
    validates :postage_id
    validates :prefecture_id
    validates :hold_date_id
    validates :price, inclusion: {in: 300..9999999 }, format: { with: /\A[0-9]+\z/ }
  end
end
