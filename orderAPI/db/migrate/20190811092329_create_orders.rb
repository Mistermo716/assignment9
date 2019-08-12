class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customerid
      t.string :email
      t.integer :itemid
      t.string :description
      t.float :award
      t.float :price
      t.float :total

      t.timestamps
    end
  end
end
