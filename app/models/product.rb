class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  %w(jpg jpeg gif png)

  extend Enumerize
  enumerize :unit, in: [:yen, :usd]
#----------------------------------------
#  ** Association **
#----------------------------------------
  has_many :basket_products, dependent: :destroy
  has_many :purchase_product_records, dependent: :destroy

#----------------------------------------
#  ** Validations **
#----------------------------------------
validates :name, presence: true
validates :description, presence: true
validates :price, presence: true
validates :unit, presence: true

end
