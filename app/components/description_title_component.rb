# frozen_string_literal: true

class DescriptionTitleComponent < ViewComponent::Base
  def initialize(title:)
    @title = title
  end
end
