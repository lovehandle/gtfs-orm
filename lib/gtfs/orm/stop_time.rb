module GTFS
  module ORM
    class StopTime < Resource

      # CONSTANTS

      FILE_NAME = "stop_times.txt".freeze

      # ATTRIBUTES

      attribute :trip_id, String
      attribute :arrival_time, String
      attribute :departure_time, String
      attribute :stop_id, String
      attribute :stop_sequence, Integer
      attribute :stop_headsign, String
      attribute :pickup_type, Integer
      attribute :drop_off_type, Integer
      attribute :shape_dist_traveled, String

      # INSTANCE METHODS

      def stops
        Stop.where(stop_id: stop_id)
      end

      def trip
        Trip.where(trip_id: trip_id)
      end

    end
  end
end
