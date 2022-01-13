require 'rails_helper'
RSpec.describe Customer, type: :model do
  describe 'relationships' do
    it { should have_many(:customer_subscriptions) }
    it { should have_many(:subscriptions).through(:customer_subscriptions) }
  end

  describe 'instance methods' do

    before :each do
      @customer_1 = Customer.create!(first_name: "First", last_name: "Last", email: "email@email.com", address: "123 Address St")
      @customer_2 = Customer.create!(first_name: "First 2", last_name: "Last 2", email: "email2@email.com", address: "234 Address St")
      @subscription_1 = Subscription.create!(title: "Subscription 1", price: "11.99", status: "active", frequency: "monthly")
      @subscription_2 = Subscription.create!(title: "Subscription 2", price: "12.99", status: "cancelled", frequency: "monthly")
      @subscription_3 = Subscription.create!(title: "Subscription 3", price: "13.99", status: "active", frequency: "monthly")
      @customer_subscription_1 = CustomerSubscription.create!(customer_id: @customer_1.id, subscription_id: @subscription_1.id)
      @customer_subscription_2 = CustomerSubscription.create!(customer_id: @customer_1.id, subscription_id: @subscription_2.id)
      @customer_subscription_3 = CustomerSubscription.create!(customer_id: @customer_2.id, subscription_id: @subscription_3.id)
    end

    it '#cancelled_subscriptions' do
      expect(@customer_1.cancelled_subscriptions.first).to eq(@subscription_2)
      expect(@customer_1.cancelled_subscriptions.length).to eq(1)
    end

    it '#active_subscriptions' do
      expect(@customer_1.active_subscriptions.first).to eq(@subscription_1)
      expect(@customer_1.active_subscriptions.length).to eq(1)
    end
  end
end
