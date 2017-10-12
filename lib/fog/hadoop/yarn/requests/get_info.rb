module Fog
  module Hadoop
    class YARN
      class Real
        def get_info
          request(
              :expects => [200, 203],
              :method => 'GET',
              :path => "#{Fog::Hadoop.yarn_endpoint}/info"
          ).body["clusterInfo"]
        end
      end
      class Mock
        def get_info
          response = Excon::Response.new
          response.status = 200
          response.body =
              {
                "id" => 1324053971963,
                "startedOn" => 1324053971963,
                "state" => "STARTED",
                "resourceManagerVersion" => "0.23.1-SNAPSHOT",
                "resourceManagerBuildVersion" => "0.23.1-SNAPSHOT from 1214049 by user1"\
                                                 " source checksum 050cd664439d931c8743a6428fd6a693",
                "resourceManagerVersionBuiltOn" => "Tue Dec 13 22:12:48 CST 2011",
                "hadoopVersion" => "0.23.1-SNAPSHOT",
                "hadoopBuildVersion" => "0.23.1-SNAPSHOT from 1214049 by user1"\
                                        " source checksum 11458df3bb77342dca5f917198fad328",
                "hadoopVersionBuiltOn" => "Tue Dec 13 22:12:26 CST 2011"

              }
          response
        end
      end
    end
  end
end