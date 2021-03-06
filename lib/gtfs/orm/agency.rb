module GTFS
  module ORM
    class Agency < Resource

      # CONSTANTS

      FILE_NAME = "agency.txt".freeze

      # ATTRIBUTES

      attribute :agency_id, String
      attribute :agency_name, String
      attribute :agency_url, String
      attribute :agency_timezone, String
      attribute :agency_lang, String
      attribute :agency_phone, String
      attribute :agency_fare_url, String

      # INSTANCE METHODS

      def routes
        Route.where(agency_id: agency_id)
      end

    end
  end
end
