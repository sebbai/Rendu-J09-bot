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
p client
client.update('Mon 2eme twitte bot, merci TheHackingProject!!!!!!!! ')