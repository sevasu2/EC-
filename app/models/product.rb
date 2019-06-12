class Product < ApplicationRecord

#----------------------------------------
#  ** Validations **
#----------------------------------------
validates :name, presence: true
validates :description, presence: true
validates :price, presence: true
validates :unit, presence: true

# 修正必須（helperに書く）
def display_price
    case unit
      when 'yen'
        "#{price.to_s(:delimited)} 円"
      when 'usd'
        "$ #{price.to_s(:delimited)}"
    end
end

end
