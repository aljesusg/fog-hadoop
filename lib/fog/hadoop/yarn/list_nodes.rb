module Fog
  module Hadoop
    class YARN
      class Real
        def list_nodes
          request(
              :expects => 200,
              :method => 'GET',
              :path => "#{Fog::Hadoop.yarn_endpoint}/nodes"
          ).body["nodes"]["node"]
        end
      end
      class Mock
        def list_nodes
          response = Excon::Response.new
          response.status = 200
          response.body =
              [
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
                      "availMemoryMB"         => 8192,
                      "usedVirtualCores"      => 0,
                      "availableVirtualCores" => 8
                  },
                  {
                      "rack"                  => "\/default-rack",
                      "state"                 => "NEW",
                      "id"                    => "h1:1234",
                      "nodeHostName"          => "h1",
                      "nodeHTTPAddress"       => "h1:2",
                      "healthStatus"          => "Healthy",
                      "lastHealthUpdate"      => 1324056895092,
                      "healthReport"          => "Healthy",
                      "numContainers"         => 0,
                      "usedMemoryMB"          => 0,
                      "availMemoryMB"         => 8192,
                      "usedVirtualCores"      => 0,
                      "availableVirtualCores" => 8
                  }
              ]
          response
        end
      end
    end
  end
end