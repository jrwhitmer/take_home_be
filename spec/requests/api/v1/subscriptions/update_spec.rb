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

  it 'returns the object with the updated status' do
    subscription_params = {
      status: "cancelled",
    }
    headers = { 'CONTENT_TYPE' => 'application/json' }

    patch "/api/v1/customers/#{@customer.id}/subscriptions/#{@subscription.id}", headers: headers, params: JSON.generate(subscription_params)

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:status]).to eq("cancelled")
    expect(parsed[:title]).to eq("Subscription 1")
    expect(parsed[:price]).to eq("11.99")
    expect(parsed[:frequency]).to eq("monthly")
  end
  it 'returns a 400 error when the cancel request is made incorrectly and throws an error' do

    patch "/api/v1/customers/#{@customer.id}/subscriptions/#{@subscription.id}"

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(400)
    expect(parsed[:error]).to eq("Missing any parameters")

  end
  it 'returns a 400 status and throws an error when status given is not active or cancelled' do
    subscription_params = {
      status: "blahblah",
    }
    headers = { 'CONTENT_TYPE' => 'application/json' }

    patch "/api/v1/customers/#{@customer.id}/subscriptions/#{@subscription.id}", headers: headers, params: JSON.generate(subscription_params)

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(400)
    expect(parsed[:error]).to eq("Not a valid status or frequency option. Try active or cancelled.")
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

  it 'now allows any attribute to be updated as well as multiple attributes at once' do
    subscription_params = {
      status: "cancelled",
      frequency: "yearly",
      title: "updated title",
      price: "16.88"
    }
    headers = { 'CONTENT_TYPE' => 'application/json' }

    patch "/api/v1/customers/#{@customer.id}/subscriptions/#{@subscription.id}", headers: headers, params: JSON.generate(subscription_params)

    subscription = Subscription.find(@subscription.id)

    expect(subscription.status).to eq("cancelled")
    expect(subscription.price).to eq("16.88")
    expect(subscription.frequency).to eq("yearly")
    expect(subscription.title).to eq("updated title")
  end
end
