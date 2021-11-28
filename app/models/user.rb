require 'digest'

class User < ApplicationRecord
  validates :username, presence: true
  #驗證email必填且為唯一值
  # https://stackoverflow.com/questions/4770133/rails-regex-for-email-validation  附上可用解答連結
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/}

  has_many :courses

  before_create :encrypt_password
  #callback
  #Synchronize同步

  def self.login(user_info)
    #login方法->如果有使用者會回傳結果，沒有的話就回傳nil
    email = user_info[:email]
    password = user_info[:password]

    salted_password = "xy#{password.reverse}hellohey"
    encryted_password = Digest::SHA1.hexdigest(salted_password)

    # 回傳登入資訊
    self.find_by(email: email, password: encryted_password)
  end

  private
  def encrypt_password
    salted_password = "xy#{self.password.reverse}hellohey"
    self.password = Digest::SHA1.hexdigest(salted_password)
  end
end
