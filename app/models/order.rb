class Order < ApplicationRecord
  belong_to :user
  belong_to :item
end
