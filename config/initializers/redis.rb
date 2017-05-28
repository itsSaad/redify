redis_host = ENV['REDIS_HOST']
redis_port = ENV['REDIS_PORT'] || 6379
puts "Will Connect to Redis at #{redis_host} on port: #{redis_port}"
Redis.current = Redis.new(host: redis_host, post: redis_port)
