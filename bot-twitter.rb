require 'twitter'

require 'dotenv'
Dotenv.load

# quelques lignes qui enregistrent les clés d'APIs
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['my_consumer_key']
  config.consumer_secret     = ENV['my_consumer_secret']
  config.access_token        = ENV['my_access_token']
  config.access_token_secret = ENV['my_access_token_secret']
end

client_stream = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = ENV['my_consumer_key']
  config.consumer_secret     = ENV['my_consumer_secret']
  config.access_token        = ENV['my_access_token']
  config.access_token_secret = ENV['my_access_token_secret']
end

topics = ["coffee", "tea"]
client_stream.filter(track: topics.join(",")) do |object|
  puts object.text if object.is_a?(Twitter::Tweet)
end

#client.update('Mon 3eme twitte bot, merci TheHackingProject!!!!!!!!')