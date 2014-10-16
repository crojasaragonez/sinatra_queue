# encoding: utf-8
require 'bunny'

class MyApp < Sinatra::Application
  get '/' do
    haml :main
  end

  post '/messages' do
    msg = params[:msg]
    connection = Bunny.new
    connection.start
    channel   = connection.create_channel
    queue     = channel.queue('test_queue', auto_delete: true)
    exchange  = channel.default_exchange
    if msg.is_a? Array
      msg.each { |e| exchange.publish(e, routing_key: queue.name) }
    else
      exchange.publish(msg, routing_key: queue.name)
    end
    connection.close
  end
end
