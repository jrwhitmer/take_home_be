require 'rails_helper'
RSpec.describe 'POST /api/v1/customers/id/subscriptions' do
  before :each do
    @customer = Customer.create!(first_name: "First", last_name: "Last", email: "email@email.com", address: "123 Address St")
  end
  it 'returns a 201 status when the request is made correctly' do
    subscription_params = {
      title: "Subscription 1",
      price: "11.99",
      status: "active",
      frequency: "monthly"
    }
    headers = { 'CONTENT_TYPE' => 'application/json' }

    post "/api/v1/customers/#{@customer.id}/subscriptions", headers: headers, params: JSON.generate(subscription_params)

    expect(response).to have_http_status(201)
  end
  it 'returns a 400 status when the request is made incorrectly and throws an error' do
    subscription_params = {
      title: "Subscription 1",
      price: "11.99",
      status: "active"
    }
    headers = { 'CONTENT_TYPE' => 'application/json' }

    post "/api/v1/customers/#{@customer.id}/subscriptions", headers: headers, params: JSON.generate(subscription_params)

    expect(response).to have_http_status(400)
    expect(response.body).to match(/Missing parameter in request/)
  end
  
end
