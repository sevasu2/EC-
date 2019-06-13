class Product < ApplicationRecord

  extend Enumerize
  enumerize :unit, in: [:yen, :usd]

#----------------------------------------
#  ** Validations **
#----------------------------------------
validates :name, presence: true
validates :description, presence: true
validates :price, presence: true
validates :unit, presence: true



end
