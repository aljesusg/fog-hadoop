module Fog
  module Hadoop
    class HDFS
      class Real
        def get_nn_status
          request(
              :expects => 200,
              :method => 'GET',
              :path => "#{Fog::Hadoop.hdfs_endpoint}?qry=Hadoop:service=NameNode,name=NameNodeStatus"
          ).body["beans"]
        end
      end
      class Mock
        def get_nn_status
          response = Excon::Response.new
          response.status = 200
          response.body =[
              {
                  "name"                 => "Hadoop:service=NameNode,name=NameNodeStatus",
                  "modelerType"          => "org.apache.hadoop.hdfs.server.namenode.NameNode",
                  "State"                => "active",
                  "SecurityEnabled"      => false,
                  "NNRole"               => "NameNode",
                  "HostAndPort"          => "machine-1.mycluster:8020",
                  "LastHATransitionTime" => 0
              }
          ]
          response
        end
      end
    end
  end
end