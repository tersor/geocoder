require "geocoder/results/base"

module Geocoder::Result
  class Kartverket < Base

    def coordinates
      [data["representasjonspunkt"]["lat"].to_f, data["representasjonspunkt"]["lon"].to_f]
    end

    def street
      data["adressetekst"]
    end

    def place
      data["poststed"]
    end

    def state
      data["kommunenavn"]
    end

    def state_code
      data["kommunenummer"]
    end

    def zip
      data["postnummer"]
    end

    def country
      "Norge"
    end

    def country_code
      "NO"
    end

    def address
      [street, city, zip, state].compact.join(", ")
    end

  end
end

