require 'rails_helper'
RSpec.describe Subscription, type: :model do
  describe 'relationships' do
    it { should have_many(:customer_subscriptions) }
    it { should have_many(:customers).through(:customer_subscriptions) }
  end
  describe 'validations' do
    it { should validate_inclusion_of(:frequency).in_array(["monthly", "weekly", "yearly"]) }
    it { should validate_inclusion_of(:status).in_array(["active", "cancelled"]) }
  end
end
