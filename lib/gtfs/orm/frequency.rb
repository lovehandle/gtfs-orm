module GTFS
  module ORM
    class Frequency < Resource

      # CONSTANTS

      FILE_NAME = "frequencies.txt".freeze

      # ATTRIBUTES

      attribute :trip_id, String
      attribute :start_time, Time
      attribute :end_time, Time
      attribute :headway_seconds, Integer
      attribute :exact_times, Integer

      # INSTANCE METHODS

      def trip
        Trip.where(trip_id: trip_id)
      end

    end
  end
end
