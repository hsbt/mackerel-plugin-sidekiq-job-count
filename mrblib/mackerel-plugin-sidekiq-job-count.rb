def __main__(argv)
  if argv[1] == "version"
    puts "v#{SidekiqJobCount::VERSION}"
  else
    res = Hash.new
    r = Redis.new argv[1], argv[2].to_i
    namespace = argv[3]

    prefix = ""
    prefix += "#{namespace}:" if namespace

    queues = r.smembers "#{prefix}queues"
    res[:enqueued] = queues.map{|queue| "#{prefix}queue:#{queue}" }.map{|k| r.llen k }.inject(0){|s, v| s + v}
    res[:retries] = r.zcard "#{prefix}retry"
    res[:scheduled] = r.zcard "#{prefix}schedule"
    res[:dead] = r.zcard "#{prefix}dead"

    r.close

    res.each do |k,v|
      puts "sidekiq_job_count.#{k}\t#{v}\t#{Time.now.to_i}"
    end
  end
end
