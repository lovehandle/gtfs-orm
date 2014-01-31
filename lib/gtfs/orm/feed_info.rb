module GTFS
  module ORM
    class FeedInfo < Resource

      # CONSTANTS

      FILE_NAME = "feed_info.txt".freeze

      # ATTRIBUTES

      attribute :feed_publisher_name, String
      attribute :feed_publisher_url, String
      attribute :feed_lang, String
      attribute :feed_start_date, Date
      attribute :feed_end_date, Date
      attribute :feed_version, String

    end
  end
end
