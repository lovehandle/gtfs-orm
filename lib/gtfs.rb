require "virtus"
require "csv"

module GTFS

  # EXCEPTIONS

  class NoPathError < Exception; end

  # CONSTANTS

  DEFAULT_PATH = './data'

  # CLASS METHODS

  def self.path=(path)
    @path
  end

  def self.path
    @path ||= DEFAULT_PATH
  end

end

require "gtfs/version"
require "gtfs/resource"

require "gtfs/agency"
require "gtfs/calendar"
require "gtfs/calendar_date"
require "gtfs/fare_attribute"
require "gtfs/fare_rule"
require "gtfs/feed_info"
require "gtfs/frequency"
require "gtfs/route"
require "gtfs/shape"
require "gtfs/stop"
require "gtfs/stop_time"
require "gtfs/transfer"
require "gtfs/trip"
