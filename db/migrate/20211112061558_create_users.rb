class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email

      t.timestamps # 融合t.datetime :created_at 和 t.datetime :updated_at
      # t.datetime :created_at 寫入創建時間
      # t.datetime :updated_at 寫入修改時間
    end
  end
end
