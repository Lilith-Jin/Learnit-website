require 'digest' #標準函式庫，會隨著Ruby出現，不需要安裝，要用時直接require

class User < ApplicationRecord
  validates :username, presence: true
  #驗證email必填且為唯一值
  # https://stackoverflow.com/questions/4770133/rails-regex-for-email-validation  附上可用解答連結
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/}

  #與courses做關聯
  has_many :courses
 
  has_many :favor_courses
  has_many :favorite_courses, through: :favor_courses, source: :course

  #建立時先做encrypt_password而非before_save
  before_create :encrypt_password 
  #callback, has own lifecycle, Rails has applied at the begining.
  #Synchronize同步

  def self.login(user_info) #user_info就是controller的params[:user]
    #login方法->如果有使用者就會回傳email和password比對，沒有的話就回傳nil
    email = user_info[:email]
    password = user_info[:password]

    salted_password = "xy#{password.reverse}hellohey"
    encryted_password = Digest::SHA1.hexdigest(salted_password)
    # find_by回傳登入資訊
    # User.find_by(email: email, password: encryted_password)
    self.find_by(email: email, password: encryted_password)
  end

  private

  def encrypt_password
    salted_password = "xy#{self.password.reverse}hellohey"
    self.password = Digest::SHA1.hexdigest(salted_password)
  end
end
