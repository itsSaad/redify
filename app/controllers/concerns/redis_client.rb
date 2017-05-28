module RedisClient
  extend ActiveSupport::Concern

  def client
    raise "RedisConnectionError" if Redis.current.nil?
    Redis.current
  end

  def set_value(key=nil, value=nil, ttl=120)
    client.setex(key, ttl, value)
  end

  def get_value(key)
    client.get(key)
  end
end
