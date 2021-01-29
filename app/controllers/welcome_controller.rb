# frozen_string_literal: true

class WelcomeController < ApplicationController
  skip_before_action :require_login, only: [:index]

  def index
    redirect_to profile_path if logged_in?
  end
end
