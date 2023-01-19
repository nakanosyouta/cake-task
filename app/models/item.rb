class Item < ApplicationRecord
  
  has_many :order_detail
  has_many :cat_item
end
