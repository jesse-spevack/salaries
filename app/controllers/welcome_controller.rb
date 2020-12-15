# frozen_string_literal: true

class WelcomeController < ApplicationController
  skip_before_action :require_login, only: [:index]

  def index
    @current_user = current_user
  end
end
