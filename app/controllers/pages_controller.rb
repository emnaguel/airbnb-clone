class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def owner_dashboard
    @boats = Boat.where(owner: current_user)
    @bookings = Booking.where(owner: current_user)
  end

  def client_dashboard
    @bookings = Booking.where(user: current_user)
  end

end
