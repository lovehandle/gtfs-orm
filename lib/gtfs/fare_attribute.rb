module GTFS
  class FareAttribute < Resource

    # CONSTANTS

    FILE_NAME = "fare_attributes.txt".freeze

    # ATTRIBUTES

    attribute :fare_id, String
    attribute :price, Float
    attribute :currency_type, String
    attribute :payment_method, Integer
    attribute :trqnsfers, Integer
    attribute :transfer_duration, Integer

  end
end
