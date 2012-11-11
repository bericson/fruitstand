class Product < ActiveRecord::Base

  attr_accessible :name, :price
  has_many :line_items

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: true

  monetize :total_cents, :allow_nil => true

  def total_cents
    price.present? ? price : 0
  end

end
