FactoryBot.define do
  factory :location do
    place_id { "ChIJpdqZ_bhh3okRv2iYAUDOAmo" }
    name { "Amsterdam, NY, USA" }

    factory :remote_location do
      place_id { "remote" }
      name { "remote" }
    end
  end
end
