class AddTimeToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :paid_at, :datetime
  end
end
