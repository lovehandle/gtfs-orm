gtfs-osm
========

## About

gtfs-orm is a Ruby Object Mapper for the Google Transit Feed Specification

## Installation

Add this line to your application's Gemfile:

```ruby
  gem "gtfs-orm", require: "gtfs/orm"
```

And then execute:

```
  $ bundle
```

Or install it yourself as:

```
  $ gem install gtfs
```

## Resources

GTFS ORM provides Ruby Object Mappings for the General Transit Feed Specification. Each file within a GTFS feed is treated as a model. As of the [current revision](https://developers.google.com/transit/gtfs/reference) of the GTFS spec published on June 20, 2012 the following resources are provided:

  * Agency
  * Stop
  * Route
  * Trip
  * StopTime
  * Calendar
  * CalendarDates
  * FareAttribute
  * FareRule
  * Shape
  * Frequency
  * Transfer
  * FeedInfo

## API

The Resource API was designed to mirror that of ActiveRecord. Common methods for returning and scoping a Collection (or returning a single Resource) will be familiar to users or Rails, and are implemented as follows:

* Resource#first (returns the first instance of the collection)
* Resource#last (returns the last instance of the collection)
* Resource#all (returns the collection)
* Resource#where (scopes the collection to resources where the specified conditions apply)
* Resource#limit (limits the number of resources returned)
* Resource#page (returns the next group of resources specified by limit)

## API Examples

The Resource `GTFS::ORM::Agency` will be used for the following examples:

Resource#first:

```ruby
GTFS::ORM::Agency.first
#=> #<GTFS::ORM::Agency:0x007f8d428f0418>
```

Resource#last
```ruby
GTFS::ORM::Agency.last
#=> #<GTFS::ORM::Agency:0x007f8d428f0418>
```

Resource#all
```ruby
GTFS::ORM::Agency.all
#=> [ #<GTFS::ORM::Agency:0x007f8d428f0418>, #<GTFS::ORM::Agency:0x006d8d4281fas98>... ]
```

Note: Collections are limited by default to return 20 resources at a time. The default limit can be modified by using the `limit` method.

Resource#where
```ruby
scope = GTFS::ORM::Agency.where(agency_id: 'METRO')
#=> #<GTFS::ORM::Resource::Scope:0x007f8d42932098>
scope.all
#=> [ #<GTFS::ORM::Agency:0x007f8d428f0418>, #<GTFS::ORM::Agency:0x006d8d4281fas98>... ]
```

Resource#limit
```ruby
scope = GTFS::ORM::Agency.limit(2)
#=> #<GTFS::ORM::Resource::Scope:0x007f8d42932098>
scope.all
#=> [ #<GTFS::ORM::Agency:0x007f8d428f0418>, #<GTFS::ORM::Agency:0x006d8d4281fas98> ]
```

Resource#page
```ruby
scope = GTFS::ORM::Agency.page(2)
#=> #<GTFS::ORM::Resource::Scope:0x007f8d42932098>
scope.all
#=> [ #<GTFS::ORM::Agency:0x007f8d428f0418>, #<GTFS::ORM::Agency:0x006d8d4281fas98> ]
```

## Usage

GTFS ORM relies upon the existence of an uncompressed GTFS dir. In order to specify the path, the following configuration must be run before attempting to access any Resources.

```
GTFS.path('/path/to/uncompressed/gtfs/dir')
```

Once the path has been specified, Resources can be accessed in the following manner.

```
GTFS::ORM::Route.limit(30).page(2).where(route_long_name: "Indios Verdes - Dr. Gálvez").all
#=> [ #<GTFS::ORM::Route:0x007f8d429f0f70>, #<GTFS::ORM::Route:0x006d8d429f0f70>...]
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/gtfs/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
