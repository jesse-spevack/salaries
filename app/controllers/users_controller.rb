class UsersController < ApplicationController
  def show
    @current_user = current_user
    @salaries = current_user.salaries.order(start_date: :desc)
    @profile = current_user.profile_first_or_initialize
  end
end
