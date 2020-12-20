class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,       foreign_key: true
      t.string :name,           null: false
      t.text :discription,      null: false
      t.integer :category_id,   null: false
      t.integer :condition_id,  null: false
      t.integer :postege_id,    null: false
      t.integer :prefecture_id, null: false
      t.integer :hold_date_id,  null: false
      t.integer :price,         null: false
      t.timestamps
    end
  end
end
