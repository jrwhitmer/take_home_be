class Subscription < ApplicationRecord
  has_many :customer_subscriptions
  has_many :customers, through: :customer_subscriptions

  validates :frequency, inclusion: { in: ["monthly", "weekly", "yearly"],
    message: "is not a valid option. Frequencies include monthly, weekly, and yearly." }

  validates :status, inclusion: { in: ["active", "cancelled"],
    message: "is not valid a valid option. Statuses include active and cancelled." }
end
