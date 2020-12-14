class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.refarences :user,  null: false, foreign_key: true
      t.refarences :item,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
