# frozen_string_literal: true

# Base controller used for common behaviors between all controllers
class ApplicationController < ActionController::Base
  before_action :require_login

  def current_user
    return unless session[:user_id]

    @current_user ||= User.find(session[:user_id])
  end

  private

  def logged_in?
    current_user.present?
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to root_path
    end
  end
end
