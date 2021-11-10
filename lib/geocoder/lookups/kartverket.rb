require 'geocoder/lookups/base'
require "geocoder/results/kartverket"

module Geocoder::Lookup
  class Kartverket < Base

    def name
      "Kartverket"
    end

    private

    def base_query_url(query)
      text = query.sanitized_text
      "#{protocol}://ws.geonorge.no/adresser/v1/sok?"
    end

    def results(query)
      return [] unless (doc = fetch_data(query))
      return [] unless doc['adresser'] || doc['adresser'].present?

      doc['adresser']
    end

    def query_url_params(query)
      {
        sok: query.sanitized_text
      }.merge(super)
    end

  end
end