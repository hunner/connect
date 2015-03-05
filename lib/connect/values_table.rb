require 'connect/selector'
require 'connect/entries/null'
require 'connect/entries/value'
require 'connect/entries/connection'
require 'connect/entries/object'
require 'method_hash'

module Connect
  class ValuesTable

    def initialize
      @values_table = {}
    end

    ##
    # 
    # Add an entry to the values tables
    #
    def add(entry)
      @values_table.merge!(entry)
    end

    def lookup(name)
      value = internal_lookup(name)
      value = value.is_a?(Entry::Base) ? value.select : value
      value.respond_to?(:to_ext) ? value.to_ext : value
    end

    ##
    #
    # Lookup an entry in the values table
    #
    def internal_lookup(name)
      name = name.to_s
      # TODO: Check if name is a valid name
      entry = @values_table.fetch(name) { Entry::Null.new}
      entry.to_final
    end


    ##
    #
    # Create a value entry for the value table. 
    #
    def self.value_entry(name, value, selector = nil )
      Entry::Value.new(name, value, selector).to_entry
    end


    ##
    #
    # Create a connection entry for the value table. 
    #
    def self.connection_entry(name, value, selector = nil, value_table = nil)
      raise ArgumentError, 'invalid value_table' if value_table.nil?
      Entry::Connection.new(name, value, selector, value_table).to_entry
    end

    ##
    #
    # Create an object entry for the value table. 
    #
    def self.object_entry(name, value, selector = nil )
      Entry::Object.new(name, value, selector).to_entry
    end


  end

end