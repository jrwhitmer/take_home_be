class Customer < ApplicationRecord
  has_many :customer_subscriptions
  has_many :subscriptions, through: :customer_subscriptions

  def self.by_id(id)
    where(id: id)
    .first
  end
end
