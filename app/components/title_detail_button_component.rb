# frozen_string_literal: true

class TitleDetailButtonComponent < ViewComponent::Base
  def initialize(button_text:, button_action:, controller:, title:, detail_target:, target:, detail:)
    @button_text = button_text
    @button_action = button_action
    @controller = controller
    @detail_target = detail_target
    @detail = detail
    @target = {"#{controller}_target" => target}
    @title = title
  end
end
