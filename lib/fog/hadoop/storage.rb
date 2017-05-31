module Fog
  module Storage
    class Hadoop < Fog::Service
      requires     :hadoop_storage_api_url

      recognizes   :storage_api_url


      request_path 'fog/hadoop/requests/storage'

      request      :get_info
      request      :get_metrics

      class Real
        include Fog::Hadoop::Utils::Request

        def initialize(options = {})

          @storage_api_url = options[:hadoop_storage_api_url] || 'https://localhost:50070/'
          Fog.credentials[:@storage_api_url]        = options[:hadoop_storage_api_url]
          @connection = Fog::Core::Connection.new(@storage_api_url)
        end
      end

      class Mock
        def initialize(options = {})
          @storage_api_url = options[:hadoop_storage_api_url] || 'https://localhost:50070/'
        end
      end
    end
  end #Compute
end