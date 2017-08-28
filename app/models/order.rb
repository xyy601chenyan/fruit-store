class Order < ApplicationRecord
  belongs_to :user

  validates :billing_name, presence:{message:"请填写订购人姓名"}
  validates :billing_address,presence:{message:"请填写订购人地址"}
  validates :shipping_name,presence:{message:"请填写收件人姓名"}
  validates :shipping_address,presence:{message:"请填写收件人地址"}
end
