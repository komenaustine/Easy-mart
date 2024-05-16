class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name,:price, :image,:description, :category, :quantity
  has_many :gallery_thumbnails
  has_many :high_resolution_images
  has_many :testimonials
end
