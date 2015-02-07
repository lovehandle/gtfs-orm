require "virtus"
require "csv"

module GTFS
  module ORM

    # EXCEPTIONS

    class NoPathError < Exception; end

    # CONSTANTS

    DEFAULT_PATH = './data'.freeze

    # CLASS METHODS

    def self.path=(path)
      @path = path
    end

    def self.path
      @path ||= DEFAULT_PATH
    end

  end
end

require "gtfs/orm/version"
require "gtfs/orm/resource"

require "gtfs/orm/agency"
require "gtfs/orm/calendar"
require "gtfs/orm/calendar_date"
require "gtfs/orm/fare_attribute"
require "gtfs/orm/fare_rule"
require "gtfs/orm/feed_info"
require "gtfs/orm/frequency"
require "gtfs/orm/route"
require "gtfs/orm/shape"
require "gtfs/orm/stop"
require "gtfs/orm/stop_time"
require "gtfs/orm/transfer"
require "gtfs/orm/trip"
