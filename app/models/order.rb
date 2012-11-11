class Order < ActiveRecord::Base
  has_many :line_items, as: :itemable

  def bill
    true
  end
end