class Item < ApplicationRecord
  has_one_attached :image

  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre

  def with_tax_price
    (price*1.1).floor
  end

  def get_image(width, height)
    image.variant(resize_to_limit: [width, height]).processed
  end
end
