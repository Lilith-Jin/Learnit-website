class CreateUsers < ActiveRecord::Migration[6.1]
  def change #早期是up和doen方法
    create_table :users do |t|
      t.string :username #varchar(100)
      t.string :password
      t.string :email

      t.timestamps # 融合t.datetime :created_at 和 t.datetime :updated_at
      # t.datetime :created_at 寫入創建時間
      # t.datetime :updated_at 寫入修改時間
    end
  end
end
