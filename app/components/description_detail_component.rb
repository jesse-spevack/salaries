# frozen_string_literal: true

class DescriptionDetailComponent < ViewComponent::Base
  def initialize(controller:, data_target:, detail:)
    @detail = detail
    @target = {"#{controller}_target" => data_target}
  end
end
