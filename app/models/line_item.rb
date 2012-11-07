class LineItem < ActiveRecord::Base

  belongs_to :cart
  belongs_to :product

  attr_accessible :price, :product_id, :quantity, :cart_id

  before_create :save_price

  monetize :total_cents, :allow_nil => true

  def total_cents
    price.present? ? quantity * price : 0
    #total_in_cents = quantity * price
    #total_in_dollars = total_in_cents / 100
    #return total_in_dollars
  end

  private

    def save_price
      self.price = product.price
    end

end