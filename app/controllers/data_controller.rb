class DataController < ApplicationController
  def index
    @data = data
  end

  private

  def data
    ["test"]
  end
end
