module GTFS
  module ORM
    class Resource

      # INCLUSIONS

      include Virtus.model

      # EXCEPTIONS

      class NonExistentResourceError < Exception; end

      # CLASS METHODS

      def self.page(page)
        Scope.new(page)
      end

      def self.first
        Scope.new(collection).first
      end

      def self.last
        Scope.new(collection).last
      end

      def self.limit(max)
        Scope.new(collection).limit(max)
      end

      def self.all
        Scope.new(collection).all
      end

      def self.where(conditions)
        Scope.new(collection).where(conditions)
      end

      private

      def self.base_path
        ORM.path
      end

      def self.file_path
        File.join(base_path, self::FILE_NAME)
      end

      def self.collection
        unless @collection
          raise NonExistentResourceError unless File.exist?(file_path)
          @collection = []
          CSV.read(file_path, headers: true).map do |row|
            @collection << new( Hash[row.headers.zip(row.fields)] )
          end
        end
        @collection
      end

      class Scope

        # CONSTANTS

        DEFAULT_LIMIT = 20.freeze
        DEFAULT_PAGE  = 1.freeze
        DEFAULT_CONDITIONS = {}.freeze

        # INITIALIZER

        def initialize(collection)
          @collection = collection
          @limit = DEFAULT_LIMIT
          @page  = DEFAULT_PAGE
          @conditions = DEFAULT_CONDITIONS
        end

        # INSTANCE METHODS

        def limit(limit = nil)
          if limit
            @limit = limit
            return self
          else
            @limit
          end
        end

        def where(conditions = nil)
          if conditions
            @conditions = conditions
            return self
          else
            @conditions
          end
        end

        def page(page=nil)
          if page
            @page = page
            return self
          else
            @page
          end
        end

        def first
          all.first
        end

        def last
          all.last
        end

        def all
          scoped_collection
        end

        private

        attr_reader :collection, :conditions

        def scoped_collection
          arr = collection.select do |item|
            match = true
            if conditions
              conditions.each_pair do |k,v|
                if item.respond_to?(k)
                  match = false unless item.send(k) == v
                end
              end
            end
            match
          end

          arr[ ((page - 1) * limit)...(page * limit)] || []
        end

      end

    end
  end
end
