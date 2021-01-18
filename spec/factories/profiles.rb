# frozen_string_literal: true

FactoryBot.define do
  factory :profile do
    user
    graduation_year { 2017 }
  end
end
