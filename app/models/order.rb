class Order < ApplicationRecord
  belongs_to :user
  belongs_to :course

  before_create :serial_generator

  private
  def serial_generator
    # now = Time.current
    # self.serial = "NFT#{now.strftime("%Y%m%d")}#{id.to_s.rjust(7,"0")}"
    #Time.now.strftime("%Y%m%d")取得8碼日期
    serial = "NFT#{Time.now.strftime("%Y%m%d")}#{id.to_s.rjust(7,"0")}"
    update(serial: serial)
  end

  def code_generator(n=7)
    # 等下要補上
  end
end
