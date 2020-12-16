# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create]

  def create
    @user = authentication_service.find_or_create_user
    session[:user_id] = @user.id
    redirect_to profile_path
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_url
  end

  private

  def authentication_service
    AuthenticationService.new(request.env["omniauth.auth"])
  end
end
