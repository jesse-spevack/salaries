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
    @data = prepare(data)
    @type = type.to_sym
    @title = @data[:title]
    @list = @data[:list]
    @icon_name = ICONS.dig(@type, :name)
    @color = ICONS.dig(@type, :color)
  end

  def render?
    @data.present? && @icon_name && @color
  end

  def prepare(data)
    case data
    when Hash
      data.with_indifferent_access
    when String
      {title: data}
    else
      {}
    end
  end
end
