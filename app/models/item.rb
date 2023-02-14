class Item < ApplicationRecord
  has_one_attached :image
  
  has_many :cart_item, dependent: :destroy
  has_many :order_detail, dependent: :destroy
  belongs_to :genre

  def get_image(width, height)
    image.variant(resize_to_limit: [width, height]).processed
  end
end
