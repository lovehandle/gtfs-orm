module GTFS
  module ORM
    class Shape < Resource

      # CONSTANTS

      FILE_NAME = "shapes.txt".freeze

      # ATTRIBUTES

      attribute :shape_id, String
      attribute :shape_pt_lat, Float
      attribute :shape_pt_lon, Float
      attribute :shape_pt_sequence, Integer
      attribute :shape_dist_traveled, Float

      # INSTANCE METHODS

      def trips
        Trip.where(shape_id: shape_id)
      end

    end
  end
end
