class Api::V1::SubscriptionsController < ApplicationController

  def create
    if params[:title].present? && params[:price].present? && params[:status].present? && params[:frequency].present?
      @current_customer = Customer.by_id(params[:customer_id])
      @new_subscription = Subscription.create!(subscription_params)
      @current_customer.subscriptions << @new_subscription
      json_response(@new_subscription, :created)
    else
      render_bad_request("Missing parameter in request")
    end
  end

  private

  def subscription_params
    params.permit(:title, :price, :status, :frequency)
  end
end