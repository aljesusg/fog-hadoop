module Fog
  module Hadoop
    class HDFS < Fog::Service
      requires     :hadoop_hdfs_api_url

      recognizes   :hdfs_api_url

      #Models
      model       :namenode
      collection :namenodes

      #requests
      request_path 'fog/hadoop/hdfs/requests'

      #CRUD
      request      :get_metrics
      request      :list_namenodes


      class Real
        include Fog::Hadoop::Utils::Request

        def initialize(options = {})

          @hdfs_api_url = options[:hadoop_hdfs_api_url] || 'https://localhost:50070/'
          Fog.credentials[:@hdfs_api_url]        = options[:hadoop_hdfs_api_url]
          @connection = Fog::Core::Connection.new(@hdfs_api_url)
        end
      end

      class Mock
        def initialize(options = {})
          @storage_api_url = options[:hadoop_hdfs_api_url] || 'https://localhost:50070/'
        end
      end
    end #SakuraCloud
  end #Compute
end