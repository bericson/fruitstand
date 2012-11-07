class Cart < ActiveRecord::Base

  # attr_accessible :title, :body

  has_many :line_items, dependent: :destroy

  monetize :total_cents

  def total_cents
    #line_items.sum(&:price)
    cart_total = 0
    line_items.each do |li|
      cart_total += li.price * li.quantity
    end
    return cart_total
  end
end
