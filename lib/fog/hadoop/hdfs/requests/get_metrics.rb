module Fog
  module Hadoop
    class HDFS
      class Real
        def get_metrics
          request(
              :expects => 200,
              :method => 'GET',
              :path => "#{Fog::Hadoop.hdfs_endpoint}?qry=Hadoop:service=NameNode,name=FSNamesystemState"
          ).body["beans"]
        end
      end
      class Mock
        def get_metrics
          response = Excon::Response.new
          response.status = 200
          response.body =[
              {
                  "name" => "Hadoop:service=NameNode,name=FSNamesystemState",
                  "modelerType" => "org.apache.hadoop.hdfs.server.namenode.FSNamesystem",
                  "CapacityTotal" => 15636578304,
                  "CapacityUsed" => 49152,
                  "CapacityRemaining" => 11699875840,
                  "TotalLoad" => 2,
                  "SnapshotStats" => "{\"SnapshottableDirectories\":0,\"Snapshots\":0}",
                  "BlocksTotal" => 0,
                  "MaxObjects" => 0,
                  "FilesTotal" => 6,
                  "PendingReplicationBlocks" => 0,
                  "UnderReplicatedBlocks" => 0,
                  "ScheduledReplicationBlocks" => 0,
                  "PendingDeletionBlocks" => 0,
                  "FSState" => "Operational",
                  "NumLiveDataNodes" => 2,
                  "NumDeadDataNodes" => 0,
                  "NumDecomLiveDataNodes" => 0,
                  "NumDecomDeadDataNodes" => 0,
                  "NumDecommissioningDataNodes" => 0,
                  "NumStaleDataNodes" => 0
              }
          ]

          response
        end
      end
    end
  end
end