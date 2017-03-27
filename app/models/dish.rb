class Dish < ApplicationRecord
  belongs_to :place
  has_many :cart_items
end
