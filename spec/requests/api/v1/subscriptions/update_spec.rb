require 'rails_helper'
RSpec.describe 'PATCH /api/v1/customers/id/subscriptions/id' do
  before :each do
    @customer = Customer.create!(first_name: "First", last_name: "Last", email: "email@email.com", address: "123 Address St")
    @subscription = Subscription.create!(title: "Subscription 1", price: "11.99", status: "active", frequency: "monthly")
    @customer_subscription = CustomerSubscription.create!(customer_id: @customer.id, subscription_id: @subscription.id)
  end
  it 'returns a 200 status when the cancel request is made correctly' do
    subscription_params = {
      status: "cancelled",
    }
    headers = { 'CONTENT_TYPE' => 'application/json' }

    patch "/api/v1/customers/#{@customer.id}/subscriptions/#{@subscription.id}", headers: headers, params: JSON.generate(subscription_params)

    expect(response).to have_http_status(200)
  end
  it 'returns a 400 error when the cancel request is made incorrectly and throws an error' do

    patch "/api/v1/customers/#{@customer.id}/subscriptions/#{@subscription.id}"

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(400)
    expect(parsed[:error]).to eq("Missing status parameter")
  end
  it 'updates the status when request is made correctly' do
    subscription_params = {
      status: "cancelled",
    }
    headers = { 'CONTENT_TYPE' => 'application/json' }

    patch "/api/v1/customers/#{@customer.id}/subscriptions/#{@subscription.id}", headers: headers, params: JSON.generate(subscription_params)

    subscription = Subscription.find(@subscription.id)

    expect(subscription.status).to eq("cancelled")
  end
end
