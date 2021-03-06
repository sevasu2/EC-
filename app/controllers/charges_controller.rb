class ChargesController < ApplicationController

  def create
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
    token = params[:stripeToken]
    product_ids = params[:product_ids].map(&:to_i)
    products = current_user.basket.products.where(id: product_ids)
    total_jpy = products.where(unit: :yen).sum(:price)
    total_usd = products.where(unit: :usd).sum(:price)
    total = total_jpy + total_usd * Basket::USD_RATE
    basket_products = current_user.basket.basket_products.where(product_id: product_ids)
    basket_products.each(&:destroy!)
    Stripe::Charge.create({
      amount: 999,
      currency: 'jpy',
      description: 'Example charge',
      source: token
    })
    redirect_to root_path, notice: '決済に成功しました'
  end
end
