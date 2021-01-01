class UsersController < ApplicationController
  def show
    @current_user = current_user
    @salaries = current_user.salaries
  end
end
