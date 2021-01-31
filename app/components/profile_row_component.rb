# frozen_string_literal: true

class ProfileRowComponent < ViewComponent::Base
  def initialize(item:, item_id:, attribute:, path:, collection:)
    @item = item
    @item_id = item_id
    @attribute = attribute
    @path = path
    @collection = collection
    @title = attribute.humanize
    @select_text = item || "Select #{@title}"
  end
end
