class City
  
  class << self
    def search(string)
      response = Faraday.get("https://maps.googleapis.com/maps/api/place/autocomplete/json") do |req|
        req.headers['Content-Type'] = 'application/json'
        req.params["input"] = string
        req.params["types"] = "(cities)"
        req.params["key"] = Rails.application.credentials[:google_places_api_key]
      end
      if response.success?
        City.new(response.body)
      end
    end
  end
end

