class Course < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_many :reviews
  # 建立關聯
  has_many :favor_courses 
  # join table讓user[id]和course[id]可以反查
  has_many :favorite_users, through: :favor_courses, source: :user
  
 
  
end
