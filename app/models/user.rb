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

  # ユーザーのカートの処理（カートがない場合にカートが作られる）
  def prepare_basket
    basket || create_basket
  end
end
