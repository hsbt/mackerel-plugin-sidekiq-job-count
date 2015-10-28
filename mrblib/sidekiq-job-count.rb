def __main__(argv)
  if argv[1] == "version"
    puts "v#{SidekiqJobCount::VERSION}"
  else
    r = Redis.new argv[1], argv[2].to_i
    namespace = argv[3]

    key = ""
    key += "#{namespace}:" if namespace
    key += 'queues'

    queues = r.smembers key
    jobs = queues.map{|queue| "#{key[0...-1]}:#{queue}" }.map{|k| r.llen k }.inject(0){|s, v| s + v}

    r.close

    puts "#{key}\t#{jobs}\t#{Time.now.to_i}"
  end
end
