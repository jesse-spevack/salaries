# frozen_string_literal: true

class NotificationComponent < ViewComponent::Base
  ICONS = {
    success: {
      name: "check-circle",
      color: "green"
    },
    error: {
      name: "x-circle",
      color: "red"
    }
  }

  def initialize(type:, data:)
    @type = type
    @data = data
    @icon_name = ICONS.dig(type.to_sym, :name)
    @color = ICONS.dig(type.to_sym, :color)
  end

  def render?
    @data.is_a?(Hash) && @icon_name && @color
  end
end
