module GTFS
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

  end
end
