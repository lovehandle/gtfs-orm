module GTFS
  class Shape < Resource

    # CONSTANTS

    FILE_NAME = "shapes.txt".freeze

    # ATTRIBUTES

    attribute :shape_id, String
    attribute :shape_pt_lat, Float
    attribute :shape_pt_lon, Float
    attribute :shape_pt_sequence, Integer
    attribute :shape_dist_traveled, Float

  end
end
