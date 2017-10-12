require 'fog/compute/openstack/models/metadata'
module Fog
  module Hadoop
    class HDFS
      class Namenode
        attribute :host
        attribute :port
        attribute :role
        attribute :state

        def initialize(attributes)
          self.host(attributes.delete(:host))
          self.port(attributes.delete(:port))
          self.role(attributes.delete(:role))
          self.state(attributes.delete(:state))
          super
        end
      end
    end
  end
end