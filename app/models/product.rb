class Product < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :gallery_thumbnails, dependent: :destroy
  has_many :high_resolution_images, dependent: :destroy

  has_many :cart_items
  has_many :carts, through: :cart_items

  has_many :testimonials
  has_many :gallery_thumbnails
  has_many :high_resolution_images
end
