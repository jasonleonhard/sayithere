# rake secret
# RAILS_ENV=production rake secret
Sayithere::Application.config.secret_token = ENV['SECRET_KEY_BASE']
# heroku config:set SECRET_KEY_BASE=the_number_you_just_saw.... 
# created to deal with heroku setting env variable 
