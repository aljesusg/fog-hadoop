require 'fog/hadoop/models/collection'
require 'fog/hadoop/hdfs/models/namenode'

module Fog
  module Hadoop
    class HDFS
      class Namenodes < Fog::Hadoop::Collection
        model Fog::Hadoop::HDFS::Namenode
        attribute :host
        attribute :port
        attribute :role
        attribute :state

        def all(options = {})
          data = hdfs.list_namenodes(options)
          puts data.inspect
        end
      end
    end
  end
end