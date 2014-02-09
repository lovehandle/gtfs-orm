module GTFS
  module ORM
    class Transfer < Resource

      # CONSTANTS

      FILE_NAME = "transfers.txt".freeze

      # ATTRIBUTES

      attribute :from_stop_id, String
      attribute :to_stop_id, String
      attribute :transfer_type, Integer
      attribute :min_transfer_time, Integer

      # INSTANCE METHODS

      def from_stop
        Stop.where(stop_id: from_stop_id)
      end

      def to_stop
        Stop.where(stop_id: to_stop_id)
      end

    end
  end
end
