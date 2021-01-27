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
    },
    notice: {
      name: "information-circle",
      color: "blue"
    }
  }

  def initialize(type:, data:)
    @data = data
    @title = data.with_indifferent_access[:title]
    @list = data[:list]
    @icon_name = ICONS.dig(type.to_sym, :name)
    @color = ICONS.dig(type.to_sym, :color)
  end

  def render?
    @data.is_a?(Hash) && @icon_name && @color
  end
end
