FactoryBot.define do
  factory :salary do
    amount { 80_000 }
    start_date { "2019-12-18" }
    end_date { "2020-12-18" }
    current_salary { false }
    remote { false }
    location
    user

    trait :current do
      current_salary { true }
    end

    trait :remote do
      remote { true }
      location { nil }
    end
  end
end
