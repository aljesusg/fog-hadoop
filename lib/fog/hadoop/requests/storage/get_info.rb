require 'multi_json'
module Fog
  module Storage
    class Hadoop
      class Real
        def get_info
          request(
                    :expects => 200,
                    :method => 'GET',
                    :path => "#{Fog::Hadoop.hdfs_endpoint}?qry=Hadoop:service=NameNode,name=NameNodeInfo"
          ).body["beans"]
        end
      end
      class Mock
        def get_info
          response = Excon::Response.new
          response.status = 200
          response.body = [ {
                               "name" => "Hadoop:service=NameNode,name=NameNodeInfo",
                               "modelerType" => "org.apache.hadoop.hdfs.server.namenode.FSNamesystem",
                               "Total" => 15636578304,
                               "Threads" => 49,
                               "ClusterId" => "CID-1de1c334-4d98-4826-b9f7-825697f9387d",
                               "Version" => "2.4.1, r1604318",
                               "Used" => 49152,
                               "Free" => 11700080640,
                               "Safemode" => "",
                               "UpgradeFinalized" => true,
                               "NonDfsUsedSpace" => 3936448512,
                               "PercentUsed" => 3.1433988E-4,
                               "BlockPoolUsedSpace" => 49152,
                               "PercentBlockPoolUsed" => 3.1433988E-4,
                               "PercentRemaining" => 74.825066,
                               "CacheCapacity" => 0,
                               "CacheUsed" => 0,
                               "TotalBlocks" => 0,
                               "TotalFiles" => 6,
                               "NumberOfMissingBlocks" => 0,
                               "LiveNodes" => "{\"node4\":{\"infoAddr\":\"10.211.55.104:50075\",\"infoSecureAddr\":\"10.211.55.104:0\",\"xferaddr\":\"10.211.55.104:50010\",\"lastContact\":0,\"usedSpace\":24576,\"adminState\":\"In Service\",\"nonDfsUsedSpace\":1968222208,\"capacity\":7818289152,\"numBlocks\":0,\"version\":\"2.4.1\",\"used\":24576,\"remaining\":5850042368,\"blockScheduled\":0,\"blockPoolUsed\":24576,\"blockPoolUsedPercent\":3.1433988E-4,\"volfails\":0},\"node3\":{\"infoAddr\":\"10.211.55.103:50075\",\"infoSecureAddr\":\"10.211.55.103:0\",\"xferaddr\":\"10.211.55.103:50010\",\"lastContact\":0,\"usedSpace\":24576,\"adminState\":\"In Service\",\"nonDfsUsedSpace\":1968226304,\"capacity\":7818289152,\"numBlocks\":0,\"version\":\"2.4.1\",\"used\":24576,\"remaining\":5850038272,\"blockScheduled\":0,\"blockPoolUsed\":24576,\"blockPoolUsedPercent\":3.1433988E-4,\"volfails\":0}}",
                               "DeadNodes" => "{}",
                               "DecomNodes" => "{}",
                               "BlockPoolId" => "BP-1540688888-10.211.55.101-1496226682396",
                               "NameDirStatuses" => "{\"failed\":{},\"active\":{\"/var/hadoop/hadoop-namenode\":\"IMAGE_AND_EDITS\"}}",
                               "NodeUsage" => "{\"nodeUsage\":{\"min\":\"0.00%\",\"median\":\"0.00%\",\"max\":\"0.00%\",\"stdDev\":\"0.00%\"}}",
                               "NameJournalStatus" => "[{\"stream\":\"EditLogFileOutputStream(/var/hadoop/hadoop-namenode/current/edits_inprogress_0000000000000000001)\",\"manager\":\"FileJournalManager(root=/var/hadoop/hadoop-namenode)\",\"required\":\"false\",\"disabled\":\"false\"}]",
                               "JournalTransactionInfo" => "{\"LastAppliedOrWrittenTxId\":\"7\",\"MostRecentCheckpointTxId\":\"0\"}",
                               "NNStarted" => "Wed May 31 10:31:27 UTC 2017",
                               "CompileInfo" => "2014-06-21T05:43Z by jenkins from branch-2.4.1",
                               "CorruptFiles" => "[]",
                               "DistinctVersionCount" => 1,
                               "DistinctVersions" => [ {
                                                           "key" => "2.4.1",
                                                           "value" => 2
                                                       } ],
                               "SoftwareVersion" => "2.4.1"
                           } ]

          response
        end
      end
    end
  end
end