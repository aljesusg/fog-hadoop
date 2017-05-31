module Fog
  module Compute
    class Hadoop < Fog::Service
      requires     :hadoop_compute_api_url

      recognizes   :compute_api_url


      request_path 'fog/hadoop/requests/compute'

      request      :get_info
      request      :get_scheduler
      request      :get_app_stats
      request      :get_app_stats_detail
      request      :get_metrics
      request      :get_node
      request      :list_nodes

      class Real
        include Fog::Hadoop::Utils::Request

        def initialize(options = {})

          @compute_api_url = options[:hadoop_compute_api_url] || 'https://localhost:8088/'
          Fog.credentials[:@compute_api_url]        = options[:hadoop_compute_api_url]
          @connection = Fog::Core::Connection.new(@compute_api_url)
        end
      end

      class Mock
        def initialize(options = {})
          @compute_api_url = options[:hadoop_compute_api_url] || 'https://localhost:8088/'
        end
      end
    end
  end #Compute
end