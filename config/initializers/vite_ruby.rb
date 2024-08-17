ViteRuby.configure do |config|
  config.dev_server_proxy = ENV['RAILS_ENV'] == 'development'
end

