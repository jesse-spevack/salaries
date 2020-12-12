# frozen_string_literal: true

# Base controller used for common behaviors between all controllers
class ApplicationController < ActionController::Base
  def current_user
    return unless session[:user_id]

    @current_user ||= User.find(session[:user_id])
  end
end
