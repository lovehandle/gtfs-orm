module GTFS
  module ORM
    class Route < Resource

      # CONSTANTS

      FILE_NAME = "routes.txt".freeze

      # ATTRIBUTES

      attribute :route_id, String
      attribute :agency_id, String
      attribute :route_short_name, String
      attribute :route_long_name, String
      attribute :route_desc, String
      attribute :route_type, Integer
      attribute :route_url, String
      attribute :route_color, String
      attribute :route_text_color, String

      # INSTANCE METHODS

      def agency
        Agency.where(agency_id: agency_id)
      end

      def trips
        Trip.where(route_id: route_id)
      end

    end
  end
end
