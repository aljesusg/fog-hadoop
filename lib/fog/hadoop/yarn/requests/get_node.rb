module Fog
  module Hadoop
    class YARN
      class Real
        def get_node(node_ref)
          request(
              :expects => [200, 203],
              :method => 'GET',
              :path => "#{Fog::Hadoop.yarn_endpoint}/nodes/#{node_ref}"
          ).body["node"]
        end
      end
      class Mock
        def get_node(node_ref)
          response = Excon::Response.new
          response.status = 200
          response.body =
              {
                  "rack"                  => "\/default-rack",
                  "state"                 => "NEW",
                  "id"                    => "h2:1235",
                  "nodeHostName"          => "h2",
                  "nodeHTTPAddress"       => "h2:2",
                  "healthStatus"          => "Healthy",
                  "lastHealthUpdate"      => 1324056895432,
                  "healthReport"          => "Healthy",
                  "numContainers"         => 0,
                  "usedMemoryMB"          => 0,
                  "availMemoryMB"         => 5120,
                  "usedVirtualCores"      => 0,
                  "availableVirtualCores" => 8
              }
          response
        end
      end
    end
  end
end