class BoatsController < ApplicationController
  before_action :set_boat, only: [:show, :edit, :update, :destroy]

  def index
    @boats = policy_scope(Boat).order(created_at: :desc)
  end

  def show
    authorize @boat
  end

  def new
    @boat = Boat.new
    authorize @boat
  end

  def edit
    authorize @boat
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.owner = current_user
    authorize @boat
    @boat.save!
    if @boat.save
      redirect_to dashboard_owner_path
    else
      render :new
    end
  end

  def update
    @boat.update(boat_params)
    authorize @boat
    if @boat.update(boat_params)
      redirect_to boat_path(@boat)
    else
      render :edit
    end
  end

  def destroy
    authorize @boat
    @boat.destroy
    redirect_to dashboard_owner_path
  end

  private

    def set_boat
      @boat = Boat.find(params[:id])
    end

    def boat_params
      params.require(:boat).permit(:name, :address, :description, :stars, :user_id, :category, :model, :capacity, :price, :photo)
    end
end
