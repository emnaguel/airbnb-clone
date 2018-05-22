class PagesController < ApplicationController
  def home
    @boats = policy_scope(Boat).order(created_at: :desc)
  end
end
