class Api::V1::SubscriptionsController < ApplicationController

  def create
    if all_params?
      current_customer = Customer.find(params[:customer_id])
      new_subscription = Subscription.create!(subscription_params)
      current_customer.subscriptions << new_subscription
      json_response(new_subscription, :created)
    else
      render_bad_request("Missing parameter in request")
    end
  end

  def update
    if any_params?
      current_subscription = Subscription.find(params[:id])
      if current_subscription.update(subscription_params)
        json_response(current_subscription, :ok)
      else
        render_bad_request("Not a valid status or frequency option. Try active or cancelled.")
      end
    else
      render_bad_request("Missing any parameters")
    end
  end

  def index
    current_customer = Customer.find(params[:customer_id])
    subscriptions = current_customer.subscriptions
    render json: subscriptions, each_serializer: SubscriptionSerializer, status: :ok
  end

  private

  def all_params?
    params[:title].present? && params[:price].present? && params[:status].present? && params[:frequency].present?
  end

  def any_params?
    params[:title].present? || params[:price].present? || params[:status].present? || params[:frequency].present?
  end

  def subscription_params
    params.permit(:title, :price, :status, :frequency)
  end
end
