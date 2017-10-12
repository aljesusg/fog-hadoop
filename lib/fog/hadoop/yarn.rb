module Fog
  module Hadoop
    class YARN < Fog::Service
      requires     :hadoop_yarn_api_url

      recognizes   :yarn_api_url


      request_path 'fog/hadoop/yarn/requests'
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

          @yarn_api_url = options[:hadoop_yarn_api_url] || 'https://localhost:8088/'
          Fog.credentials[:@yarn_api_url]        = options[:hadoop_yarn_api_url]
          @connection = Fog::Core::Connection.new(@yarn_api_url)
        end
      end

      class Mock
        def initialize(options = {})
          @compute_api_url = options[:hadoop_yarn_api_url] || 'https://localhost:8088/'
        end
      end
    end
  end #Yarn
end