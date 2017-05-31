Shindo.tests('Fog::Storage[:hadoop] | info request', ['hadoop', 'storage']) do

    @info_format = [ {
                         "name" => String,
                         "modelerType" => String,
                         "Total" => Integer,
                         "Threads" => Integer,
                         "ClusterId" => String,
                         "Version" => String,
                         "Used" => Integer,
                         "Free" => Integer,
                         "Safemode" => "",
                         "UpgradeFinalized" => Fog::Boolean,
                         "NonDfsUsedSpace" => Integer,
                         "PercentUsed" => Float,
                         "BlockPoolUsedSpace" => Integer,
                         "PercentBlockPoolUsed" => Float,
                         "PercentRemaining" => Float,
                         "CacheCapacity" => Integer,
                         "CacheUsed" => Integer,
                         "TotalBlocks" => Integer,
                         "TotalFiles" => Integer,
                         "NumberOfMissingBlocks" => Integer,
                         "LiveNodes" => String,
                         "DeadNodes" => String,
                         "DecomNodes" => String,
                         "BlockPoolId" => String,
                         "NameDirStatuses" => String,
                         "NodeUsage" => String,
                         "NameJournalStatus" => String,
                         "JournalTransactionInfo" => String,
                         "NNStarted" => String,
                         "CompileInfo" => String,
                         "CorruptFiles" => String,
                         "DistinctVersionCount" => Integer,
                         "DistinctVersions" => [ {
                                                     "key" => String,
                                                     "value" => Integer
                                                 } ],
                         "SoftwareVersion" => String
                     } ]

  tests('success') do
    tests('#get_info') do
      info = hadoop_storage_service.get_info
      test 'returns a Hash' do
        info.body.is_a? Array
        info.body[0].is_a? Hash
      end
      if Fog.mock?
        tests('Info').formats(@info_format, false) do
          info.body
        end
      else
        returns(200) { info.status }
        returns(true) { info.body.is_a? Array }
        returns(true) { info.body[0].is_a? Hash }
      end
    end
  end
end

