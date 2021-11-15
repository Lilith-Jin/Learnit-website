class User < ApplicationRecord
  validates :username, presence: true
  #驗證email必填且為唯一值
  validates :email, presence: true, uniqueness: true
end
