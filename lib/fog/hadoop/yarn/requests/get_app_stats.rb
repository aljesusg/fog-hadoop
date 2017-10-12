module Fog
  module Hadoop
    class YARN
      class Real
        def get_app_stats
          request(
              :expects => [200, 203],
              :method => 'GET',
              :path => "#{Fog::Hadoop.yarn_endpoint}/appstatistics"
          ).body["appStatInfo"]["statItem"]
        end
      end
      class Mock
        def get_app_stats
          response = Excon::Response.new
          response.status = 200
          response.body =
              [
                {
                  "state" => "accepted",
                  "type"  => "mapreduce",
                  "count" => 4
                },
                {
                  "state" => "running",
                  "type"  =>  "mapreduce",
                  "count" => 1
                },
                {
                  "state" => "finished",
                  "type"  => "mapreduce",
                  "count" => 7
                }
              ]
          response
        end
      end
    end
  end
end