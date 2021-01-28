class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      #restaurant_idカラムを作成し、FKとする
      t.references :restaurant, null: false, foreign_key: true
      t.integer :total_price, null: false, default: 0

      t.timestamps
    end
  end
end
