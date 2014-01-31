module GTFS
  module ORM
    class Calendar < Resource

      # CONSTANTS

      FILE_NAME = "calendar.txt".freeze

      # ATTRIBUTES

      attribute :service_id, String
      attribute :monday, Integer
      attribute :tuesday, Integer
      attribute :wednesday, Integer
      attribute :thursday, Integer
      attribute :friday, Integer
      attribute :saturday, Integer
      attribute :sunday, Integer
      attribute :start_date, Date
      attribute :end_date, Date

    end
  end
end
