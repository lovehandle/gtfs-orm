module GTFS
  module ORM
    class FareAttribute < Resource

      # CONSTANTS

      FILE_NAME = "fare_attributes.txt".freeze

      # ATTRIBUTES

      attribute :fare_id, String
      attribute :price, Float
      attribute :currency_type, String
      attribute :payment_method, Integer
      attribute :transfers, Integer
      attribute :transfer_duration, Integer

      # INSTANCE METHODS

      def fare_rule
        FareRule.where(fare_id: fare_id)
      end

    end
  end
end
