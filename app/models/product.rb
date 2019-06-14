class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  %w(jpg jpeg gif png)

  extend Enumerize
  enumerize :unit, in: [:yen, :usd]
  has_many :basket_products, dependent: :destroy

#----------------------------------------
#  ** Validations **
#----------------------------------------
validates :name, presence: true
validates :description, presence: true
validates :price, presence: true
validates :unit, presence: true

end
