class Item < ApplicationRecord
  has_one_attached :image
  
  def get_image(height,width)
    image.variant(resize_to_limit: [height,width]).processed
  end
end
