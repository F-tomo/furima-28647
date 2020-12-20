class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :discription
    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id
    validates :postage_id
    validates :prefecture_id
    validates :hold_date_id
    validates :price, inclusion: {in: 300..9999999 }, format: { with: /\A[0-9]+\z/ }
  end
end
