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

      # INSTANCE METHODS

      def trips
        Trip.where(service_id: service_id)
      end

      def calendar_date
        CalendarDate.where(service_id: service_id)
      end

    end
  end
end
