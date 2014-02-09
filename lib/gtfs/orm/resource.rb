module GTFS
  module ORM
    class Resource

      # INCLUSIONS

      include Virtus.model

      # EXCEPTIONS

      class NonExistentResourceError < Exception; end

      # CLASS METHODS

      def self.page(page)
        scope.page(page)
      end

      def self.first
        scope.first
      end

      def self.last
        scope.last
      end

      def self.limit(max)
        scope.limit(max)
      end

      def self.all
        scope.all
      end

      def self.where(conditions)
        scope.where(conditions)
      end

      def self.length
        scope.length
      end

      def self.count
        scope.length
      end

      def self.scope
        Scope.new(collection)
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

        # INCLUSIONS

        include Enumerable

        # CONSTANTS

        DEFAULT_LIMIT = nil.freeze
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

        def to_s
          "<##{self.class}:#{self.object_id.to_s(8)}>"
        end

        alias :inspect :to_s

        def each
          return to_enum unless block_given?
          all.each {|resource| yield resource }
          self
        end

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

        def length
          all.length
        end

        def first
          all.first
        end

        def last
          all.last
        end

        def all
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

          if limit
            arr[ ((page - 1) * limit)...(page * limit)] || []
          else
            arr
          end

        end

        private

        attr_reader :collection, :conditions

      end

    end
  end
end
