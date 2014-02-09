module GTFS
  module ORM
    class Trip < Resource

      # CONSTANTS

      FILE_NAME = "trips.txt".freeze

      # ATTRIBUTES

      attribute :route_id, String
      attribute :service_id, Integer
      attribute :trip_id, String
      attribute :trip_headsign, String
      attribute :trip_short_name, String
      attribute :direction_id, Integer
      attribute :block_id, Integer
      attribute :shape_id, Integer
      attribute :wheelchair_accessible, Boolean

      # INSTANCE METHODS

      def route
        Route.where(route_id: route_id)
      end

      def calendar
        Calendar.where(service_id: service_id)
      end

      def shape
        Shape.where(shape_id: shape_id)
      end

      def stop_times
        StopTime.where(trip_id: trip_id)
      end

    end
  end
end
