# config/initializers/recaptcha.rb
Recaptcha.configure do |config|
  config.site_key  = '6LdFUoMUAAAAABKpmO3W8AQh71hunGY6FkOnLR2K'
  config.secret_key = '6LdFUoMUAAAAAEkdZEVo26RV13hY_FGnBxniqcwH'
  # Uncomment the following line if you are using a proxy server:
  # config.proxy = 'http://myproxy.com.au:8080'
end
