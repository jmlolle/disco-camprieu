
require 'twitter'
require 'google_drive'
require 'dotenv'

Dotenv.load

def client

    client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['TWITTER_API_CONSUMER_KEY']
        config.consumer_secret     = ENV['TWITTER_API_CONSUMER_SECRET']
        config.access_token        = ENV['TWITTER_API_ACCESS_TOKEN']
        config.access_token_secret = ENV['TWITTER_API_ACCESS_TOKEN_SECRET']
      end
end


topics = ["coder", "freecode", "ruby", "formation", "informatique", "code", "rails", "gratuit", "digital", "coding", "training", "learning"]
client.filter(track: topics.join(",")) do |object|
  puts object.text if object.is_a?(Twitter::Tweet)
end

client.user do |object|
  case object
  when Twitter::Tweet
    puts " Bonjour, vous voulez apprendre a coder gratuitement et rapidement ? Rejoignez-nous: https://marseillewestcoast.herokuapp.com/   "
  when Twitter::DirectMessage
    puts " Bonjour, vous voulez apprendre a coder gratuitement et rapidement ? Rejoignez-nous: https://marseillewestcoast.herokuapp.com/   "
  when Twitter::Streaming::StallWarning
    warn " Bonjour, vous voulez apprendre a coder gratuitement et rapidement ? Rejoignez-nous: https://marseillewestcoast.herokuapp.com/   "
  end
end
