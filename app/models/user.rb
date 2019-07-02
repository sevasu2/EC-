class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

#----------------------------------------
#  ** Association **
#----------------------------------------
  has_one :basket, dependent: :destroy
  has_one :purchase_record, dependent: :destroy

  # ユーザーのカートの処理（カートがない場合にカートが作られる）
  def prepare_basket
    basket || create_basket
  end

  def prepare_purchase_record
     purchase_record || create_purchase_record
  end

  purchase_record = prepare_purchase_record
  ids = product_ids.map { |id| { product_id: id } }
  purchase_record.purchase_record_products.create!(ids)
end
