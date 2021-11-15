require 'digest'

class User < ApplicationRecord
  validates :username, presence: true
  #驗證email必填且為唯一值
  # https://stackoverflow.com/questions/201323/how-can-i-validate-an-email-address-using-a-regular-expression  附上可用解答連結
  validates :email, presence: true, uniqueness: true, format: { with: /^\S+@\S+\S.\S+$/}

  before_create :encrypt_password
  #callback
  #Synchronize同步

  def self.login(user_info)
    email = user_info[:email]
    password = user_info[:password]

    salted_password = "xy#{password.reverse}hellohey"
    encryted_password = Digest::SHA1.hexdigest(salted_password)

    self.find_by(email: email, password: encryted_password)
  end

  private
  def encrypt_password
    salted_password = "xy#{self.password.reverse}hellohey"
    self.password = Digest::SHA1.hexdigest(salted_password)
  end
end
