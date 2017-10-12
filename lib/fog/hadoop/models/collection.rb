require 'fog/core/collection'

module Fog
  module Hadoop
    class Collection < Fog::Collection
      attr_accessor :response
    end
  end
end