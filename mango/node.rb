require 'redis-objects'


Redis.current = Redis.new(:host => '5ozorojr5rw4zeaivsuugbpx5i25fxrgxpjmo3kd4mdt44rl4upcubyd.onion', :port => 6379)

Process.detach( fork { Redis.new.monitor {|e| puts "|-> #{e}" } } )
