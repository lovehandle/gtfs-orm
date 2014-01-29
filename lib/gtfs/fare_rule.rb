module GTFS
  class FareRule < Resource

    # CONSTANTS

    FILE_NAME = "fare_rules.txt".freeze

    # ATTRIBUTES

    attribute :fare_id, String
    attribute :route_id, String
    attribute :origin_id, String
    attribute :destination_id, String
    attribute :contains_id, String

  end
end
