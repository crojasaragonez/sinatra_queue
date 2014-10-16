require 'bunny'

connection = Bunny.new
connection.start
channel = connection.create_channel
queue  = channel.queue('test_queue', auto_delete: true)

queue.subscribe do |_, _, msg|
  puts "Received #{msg}"
end

sleep 1 while true
