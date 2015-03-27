class CreateDinnings < ActiveRecord::Migration
  def change
    create_table :dinnings do |t|
      t.decimal :quantity, precision: 8, scale: 2
      t.decimal :price, precision: 8, scale: 2
      t.decimal :rate, precision: 8, scale: 2
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
