Shindo.tests('Fog::Storage[:hadoop] | metrics request', ['hadoop', 'storage']) do

  @metrics_format = [{
      "name" => String,
      "modelerType" => String,
      "CapacityTotal" => Integer,
      "CapacityUsed" => Integer,
      "CapacityRemaining" => Integer,
      "TotalLoad" => Integer,
      "SnapshotStats" => String,
      "BlocksTotal" => Integer,
      "MaxObjects" => Integer,
      "FilesTotal" => Integer,
      "PendingReplicationBlocks" => Integer,
      "UnderReplicatedBlocks" => Integer,
      "ScheduledReplicationBlocks" => Integer,
      "PendingDeletionBlocks" => Integer,
      "FSState" => String,
      "NumLiveDataNodes" => Integer,
      "NumDeadDataNodes" => Integer,
      "NumDecomLiveDataNodes" => Integer,
      "NumDecomDeadDataNodes" => Integer,
      "NumDecommissioningDataNodes" => Integer,
      "NumStaleDataNodes" => Integer
  }]

  tests('success') do
    tests('#get_metrics') do
      metrics = hadoop_storage_service.get_metrics
      test 'returns a Hash' do
        metrics.body.is_a? Array
      end
      if Fog.mock?
        tests('Metrics').formats(@metrics_format, false) do
          metrics.body
        end
      else
        returns(200) { metrics.status }
        returns(true) { metrics.body.is_a? Array }
      end
    end
  end
end
