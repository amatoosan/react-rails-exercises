class Restaurant < ApplicationRecord
  has_many :foods
  #through: :foodsにより、foodモデルを経由せずにline_foodモデルにアクセスできる
  has_many :line_foods, through: :foods
  #optional: trueにより、belongs_toで外部キーのnilを許可
  belongs_to :order, optional: true

  validates :name, :fee, :time_required, presence: true
  validates :name, length: { maximum: 30 }
  #feeが0以上になるように制限
  validates :fee, numericality: { greater_than: 0 }
end
