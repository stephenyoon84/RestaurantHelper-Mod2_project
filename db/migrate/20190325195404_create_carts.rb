class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|
      t.integer :user_id
      t.integer :menu_id
      t.boolean :paid, default:false

      t.timestamps
    end
  end
end
