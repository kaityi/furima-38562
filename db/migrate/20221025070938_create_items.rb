class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.integer :item_price , null: false
      t.text :item_explain, null: false
      t.integer :item_category_id, null: false
      t.integer :item_situation_id, null: false
      t.integer :delivery_charge_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :date_of_shipment_id, null: false
      t.references :user, null: false,foreign_key: true
      
      t.timestamps
    end
  end
end
