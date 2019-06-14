class BasketProduct < ApplicationRecord

#----------------------------------------
#  ** Association **
#----------------------------------------
belongs_to :basket
belongs_to :product

end
