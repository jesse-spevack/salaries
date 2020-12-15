require "rails_helper"

RSpec.feature "unauthenticated users" do
  scenario "are redirected to welcome page" do
    visit profile_path(build(:user))
    expect(current_path).to eq root_path
  end
end
