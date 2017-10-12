module Fog
  module Hadoop
    class YARN
      class Real
        def get_app_stats_detail(options = {})
          request(
              :expects => [200, 203],
              :method => 'GET',
              :path => "#{Fog::Hadoop.yarn_endpoint}/appstatistics?#{URI.encode_www_form(options)}"
          ).body["appStatInfo"]["statItem"]
        end
      end
      class Mock
        def get_app_stats_detail(options = {})
          response = Excon::Response.new
          response.status = 200
          response.body =
              [
                {
                  "state" => "accepted",
                  "type"  => "mapreduce",
                  "count" => 4
                }
              ]
          response
        end
      end
    end
  end
end