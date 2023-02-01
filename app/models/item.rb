class Item < ApplicationRecord
  
  has_many :order_detail
  has_many :cat_item
  
  has_one_attached :image
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [100, 100]).processed
  end
  
  def with_tax_porice
    (porice * 1.1).floor
  end
  
end
