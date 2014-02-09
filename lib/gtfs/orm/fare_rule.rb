module GTFS
  module ORM
    class FareRule < Resource

      # CONSTANTS

      FILE_NAME = "fare_rules.txt".freeze

      # ATTRIBUTES

      attribute :fare_id, String
      attribute :route_id, String
      attribute :origin_id, String
      attribute :destination_id, String
      attribute :contains_id, String

      # INSTANCE METHODS

      def fare_attributes
        FareAttribute.where(fare_id: fare_id)
      end

      def route
        Route.where(route_id: route_id)
      end

      def origins
        Stop.where(zone_id: origin_id)
      end

      def destinations
        Stop.where(zone_id: destination_id)
      end

    end
  end
end
