# frozen_string_literal: true

class AlertComponent < ViewComponent::Base
  def initialize(header:, body:, path: nil)
    @header = header
    @body = body
    @path = path
  end
end
