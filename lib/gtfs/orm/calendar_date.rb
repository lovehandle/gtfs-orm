module GTFS
  module ORM
    class CalendarDate < Resource

      # CONSTANTS

      FILE_NAME = "calendar_dates.txt".freeze

      # ATTRIBUTES

      attribute :service_id, String
      attribute :date, Date
      attribute :exception_type, Integer

    end
  end
end
