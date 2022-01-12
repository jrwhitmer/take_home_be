require 'rails_helper'
RSpec.describe "GET /api/v1/customers/id/subscriptions" do
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
  it 'returns a 200 status when request is made' do
    get "/api/v1/customers/#{@customer_1.id}/subscriptions"

    expect(response.status).to eq(200)
  end
  it 'renders cancelled subscriptions and active subscriptions' do
    get "/api/v1/customers/#{@customer_1.id}/subscriptions"

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[0][:title]).to eq("Subscription 1")
    expect(parsed[1][:title]).to eq("Subscription 2")
  end
  it 'renders all subscriptions for that customer only' do
    get "/api/v1/customers/#{@customer_1.id}/subscriptions"

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[0][:title]).to eq("Subscription 1")
    expect(parsed[-1][:title]).to eq("Subscription 2")
  end
end
