class LineFood < ApplicationRecord
  belongs_to :food
  belongs_to :restaurant
  belongs_to :order, optional: true

  validates :count, numericality: { greater_than: 0 }

  #全てのLineFoodからwhereでactive: trueなものを、ActiveRecord_Relationとして返す
  scope :active, -> { where(active: true) }

  #restaurant_idが特定の店舗IDではないものの一覧を返す(「他の店舗のLineFood」があるかどうか？をチェックする)
  #「他の店舗のLineFood」があった場合、ここには１つ以上の関連するActiveRecord_Relationが入る
  scope :other_restaurant, -> (picked_restaurant_id) { where.not(restaurant_id: picked_restaurant_id) }

  #インスタンスメソッドを定義
  def total_amount
    food.price * count
  end
end
