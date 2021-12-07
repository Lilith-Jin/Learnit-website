class Course < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_many :reviews
  has_many :orders
  # 建立關聯
  has_many :favor_courses 
  # join table讓user[id]和course[id]可以反查
  has_many :favorite_users, through: :favor_courses, source: :user
  
  def prepare_order(params)
    params = params.merge(
      amount: self.price,
      state: 'pending'
    )
    # orders 從課程的角度new新訂單，但還沒存
    orders.build(params)
  end
  
end
