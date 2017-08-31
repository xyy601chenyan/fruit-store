class Order < ApplicationRecord
  before_create :generate_token
  belongs_to :user
  has_many :product_lists
  validates :billing_name, presence:{message:"请填写订购人姓名"}
  validates :billing_address,presence:{message:"请填写订购人地址"}
  validates :shipping_name,presence:{message:"请填写收件人姓名"}
  validates :shipping_address,presence:{message:"请填写收件人地址"}

  def generate_token
      self.token = SecureRandom.uuid
  end

  def set_payment_with!(method)
    self.update_columns(payment_method: method)

  end

  def pay!
    self.update_columns(is_paid: true)

  end

  include AASM

  aasm do
    state :order_placed, initial: true
    state :paid
    state :shipping
    state :shipped
    state :order_cancelled
    state :good_returned

    event :make_payment, after_commit: :pay! do
      transistions from: :order_placed, to: :paid
    end

    event :ship do
      transistions from: :paid, to: :shipping
    end

    event :deliver do
      transistions from: :shipping, to: :shipped
    end

    event :return_good do
      transistions from: :shipped, to: :good_returned
    end

    event :cancel_order do
      transistions from: [:order_placed, :paid], to: :order_cancelled
    end

  end

end
