class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.float :price
      t.string :description
      t.integer :stockQty

      t.timestamps
    end
  end
end
