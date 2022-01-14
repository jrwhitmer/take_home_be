class Customer < ApplicationRecord
  has_many :customer_subscriptions
  has_many :subscriptions, through: :customer_subscriptions

  def cancelled_subscriptions
    subscriptions.where(status: "cancelled")
  end

  def active_subscriptions
    subscriptions.where(status: "active")
  end
end
