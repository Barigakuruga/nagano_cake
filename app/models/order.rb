class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :customer

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting_for_deposit: 0, deposit_confirmation: 1, cooking: 2, shipping_preparing: 4, shipped: 5 }
end
