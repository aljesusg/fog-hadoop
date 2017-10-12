module Fog
  module Hadoop
    class YARN
      class Real
        def get_metrics
          request(
              :expects => 200,
              :method => 'GET',
              :path => "#{Fog::Hadoop.yarn_endpoint}/metrics"
          ).body["clusterMetrics"]
        end
      end
      class Mock
        def get_metrics
          response = Excon::Response.new
          response.status = 200
          response.body =
                  {
                      "appsSubmitted"         => 0,
                      "appsCompleted"         => 0,
                      "appsPending"           => 0,
                      "appsRunning"           => 0,
                      "appsFailed"            => 0,
                      "appsKilled"            => 0,
                      "reservedMB"            => 0,
                      "availableMB"           => 17408,
                      "allocatedMB"           => 0,
                      "reservedVirtualCores"  => 0,
                      "availableVirtualCores" => 7,
                      "allocatedVirtualCores" => 1,
                      "containersAllocated"   => 0,
                      "containersReserved"    => 0,
                      "containersPending"     => 0,
                      "totalMB"               => 17408,
                      "totalVirtualCores"     => 8,
                      "totalNodes"            => 1,
                      "lostNodes"             => 0,
                      "unhealthyNodes"        => 0,
                      "decommissionedNodes"   => 0,
                      "rebootedNodes"         => 0,
                      "activeNodes"           => 1
                  }

          response
        end
      end
    end
  end
end