class User < ApplicationRecord
  validates :username, presence: true
  #驗證email必填且為唯一值
  # https://stackoverflow.com/questions/201323/how-can-i-validate-an-email-address-using-a-regular-expression  附上可用解答連結
  validates :email, presence: true, uniqueness: true, format: { with: /^\S+@\S+\S.\S+$/, message: "only allows letters" }
end
