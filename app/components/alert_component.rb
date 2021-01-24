# frozen_string_literal: true

class AlertComponent < ViewComponent::Base
  def initialize(header:, body:)
    @header = header
    @body = body
  end
end
