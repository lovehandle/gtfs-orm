module GTFS
  module ORM
    class StopTime < Resource

      # CONSTANTS

      FILE_NAME = "stop_times.txt".freeze

      # ATTRIBUTES

      attribute :trip_id, Integer
      attribute :arrival_time, Time
      attribute :departure_time, Time
      attribute :stop_id, String
      attribute :stop_sequence, Integer
      attribute :stop_headsign, String
      attribute :pickup_type, Integer
      attribute :drop_off_type, Integer
      attribute :shape_dist_traveled, String

    end
  end
end
