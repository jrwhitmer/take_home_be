# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first

@customer_1 = Customer.create!(first_name: "First", last_name: "Last", email: "email@email.com", address: "123 Address St")
@customer_2 = Customer.create!(first_name: "First 2", last_name: "Last 2", email: "email2@email.com", address: "234 Address St")
@subscription_1 = Subscription.create!(title: "Subscription 1", price: "11.99", status: "active", frequency: "monthly")
@subscription_2 = Subscription.create!(title: "Subscription 2", price: "12.99", status: "cancelled", frequency: "monthly")
@subscription_3 = Subscription.create!(title: "Subscription 3", price: "13.99", status: "active", frequency: "monthly")
@customer_subscription_1 = CustomerSubscription.create!(customer_id: @customer_1.id, subscription_id: @subscription_1.id)
@customer_subscription_2 = CustomerSubscription.create!(customer_id: @customer_1.id, subscription_id: @subscription_2.id)
@customer_subscription_3 = CustomerSubscription.create!(customer_id: @customer_2.id, subscription_id: @subscription_3.id)
