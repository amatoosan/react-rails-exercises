class Food < ApplicationRecord
  belongs_to :restaurant
  belongs_to :order, optional: true
  #has_oneは1:1の関係を表す
  has_one :line_food
end
