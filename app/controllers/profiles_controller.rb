class ProfilesController < ApplicationController
  before_action :set_profile, only: [:update]

  def create
    @profile = Profile.new(user: current_user)
    @profile.graduation_year = params[:graduation_year]
    if @profile.save
      head :created
    else
      head :bad_request
    end
  end

  def update
    @profile.graduation_year = params[:graduation_year]
    if @profile.save
      head :accepted
    else
      head :bad_request
    end
  end

  private

  def set_profile
    @profile = Profile.find_by(user: @current_user)
  end
end
