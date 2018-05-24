class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @boats = policy_scope(Boat).order(created_at: :desc)
    if params[:category].present? && params[:where].blank? && params[:start_date].blank? && params[:end_date].blank?
      sql_query = " boats.category @@ ? "
      @boats = Boat.where(sql_query, "%#{params[:category]}%")

    elsif params[:category].present? && params[:where].present? && params[:start_date].blank? && params[:end_date].blank?
      @boats = Boat.near(params[:where], 100)

      sql_query = " boats.category @@ :cat"
      @boats = @boats.where(sql_query, cat: "%#{params[:category]}%")

    elsif params[:category].present? && params[:where].present? && params[:start_date].present? && params[:end_date].present?
      @boats = Boat.near(params[:where], 100)

      sql_query = " boats.category @@ :cat AND boats.category @@ :cat"
      @boats = @boats.joins(:bookings).where(sql_query, cat: "%#{params[:category]}%")

    else
      @boats = Boat.all
    end
    @markers = @boats.map do |boat|
      {
        lat: boat.latitude,
        lng: boat.longitude,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end

  def dashboard_owner
    @boats = Boat.where(owner: current_user)
    @bookings_as_owner = Booking.where(owner: current_user.id)
  end

  def dashboard_renter
    @bookings_as_client = Booking.where(user: current_user)
  end

end



