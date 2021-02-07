# frozen_string_literal: true

class ProfileComponent < ViewComponent::Base
  def initialize(profile:)
    @profile = profile
  end
end
