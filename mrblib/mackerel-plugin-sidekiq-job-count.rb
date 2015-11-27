def __main__(argv)
  if argv[1] == "version"
    puts "v#{SidekiqJobCount::VERSION}"
  else
    r = Redis.new argv[1], argv[2].to_i
    namespace = argv[3]

    prefix = ""
    prefix += "#{namespace}:" if namespace

    queues = r.smembers prefix + "queues"
    enqueued = queues.map{|queue| "#{prefix}queue:#{queue}" }.map{|k| r.llen k }.inject(0){|s, v| s + v}

    r.close

    puts "sidekiq_job_count.enqueued\t#{enqueued}\t#{Time.now.to_i}"
  end
end
