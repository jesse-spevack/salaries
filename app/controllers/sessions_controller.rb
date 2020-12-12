# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_by(slack_id: auth_hash.info.user_id)
    session[:user_id] = @user.id
    redirect_to root_url
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_url
  end

  private

  def auth_hash
    request.env["omniauth.auth"]
  end
end
