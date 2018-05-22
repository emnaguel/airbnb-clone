class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard_owner
    @boats = Boat.where(owner: current_user)
    @bookings_as_owner = Booking.where(owner: current_user)
  end

  def dashboard_renter
    @bookings_as_client = Booking.where(user: current_user)
  end

end
