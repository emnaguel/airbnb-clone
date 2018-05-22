class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @boats = policy_scope(Boat).order(created_at: :desc)
  end

  def dashboard_owner
    @boats = Boat.where(owner: current_user)
    @bookings_as_owner = Booking.where(owner: current_user)
  end

  def dashboard_renter
    @bookings_as_client = Booking.where(user: current_user)
  end

end
