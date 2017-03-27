class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :place
  has_many :cart_items

  def summ
  	cart_items.sum { |p| p.price * p.amount }
  end
end
