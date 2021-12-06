class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :serial
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :amount
      t.string :recipient
      t.string :address
      t.string :state

      t.timestamps
    end
    add_index :orders, :serial, unique: true
  end
end
